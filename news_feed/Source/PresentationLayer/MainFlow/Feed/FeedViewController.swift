//
//  FeedViewController.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIKit

protocol FeedViewControllerInput {}

protocol FeedViewControllerOutput: class {
    func feedVCDidFinish(_ vc: FeedViewControllerInput)
}

class FeedViewController: UIViewController, FeedViewControllerInput, FeedbackViewController {
    
    typealias TEvent = Event
    typealias TState = State
    
    weak var output: FeedViewControllerOutput?
    
    // MAR: - DI
    var interactor: FeedInteractor
    
    // MARK: - props
    var dispatchQueue: DispatchQueue
    var oldState: State
    var state: State
    
    init(interactor: FeedInteractor) {
        self.interactor = interactor
        dispatchQueue = DispatchQueue(label: "ru.togishiro.FeedViewController")
        
        oldState = Self.initialState()
        state = oldState
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = FeedView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: -
    func handleOutput(_ outputEvent: State.Output) {
        
    }
    
    func handleAction(_ actionEvent: State.Action) {
        
    }
}
