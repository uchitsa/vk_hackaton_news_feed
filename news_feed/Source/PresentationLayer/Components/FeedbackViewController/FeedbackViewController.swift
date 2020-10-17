//
//  FeedbackViewController.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation

protocol FeedbackViewController: class {
    associatedtype TEvent
    associatedtype TState: FeedbackVCState
    
    var dispatchQueue: DispatchQueue { get set }
    
    var oldState: TState { get set }
    var state: TState { get set }
    
    func handleOutput(_ outputEvent: TState.TOutput)
    func handleAction(_ actionEvent: TState.TAction)
    func bindUI(to state: TState, oldState: TState)
    
    static func reduce(_ event: TEvent, _ state: TState) -> TState
    
    func react(to request: TState.TRequest)
}

extension FeedbackViewController {
    func acceptEvent(_ event: TEvent) {
        dispatchQueue.async { [weak self] in
            guard let __self = self else { return }
            
            var oldState = __self.state
            oldState.output = nil
            oldState.actions = []
            
            let newState = Self.reduce(event, oldState)
            
            __self.oldState = oldState
            __self.state = newState
            
            __self.react(to: newState, prevState: __self.oldState)
            
            DispatchQueue.main.sync { [weak self] in
                guard let __self = self else { return }
                __self.bindUI(to: newState, oldState: __self.oldState)
                
                if let output = newState.output {
                    __self.handleOutput(output)
                }
                for action in newState.actions {
                    __self.handleAction(action)
                }
            }
        }
    }
    
    func react(to state: TState, prevState: TState) {
        let newRequests = state.requests.subtracting(prevState.requests)
        guard !newRequests.isEmpty else { return }
        
        newRequests.forEach { [weak self] item in
            guard let __self = self else { return }
            __self.react(to: item)
        }
    }
    
}
