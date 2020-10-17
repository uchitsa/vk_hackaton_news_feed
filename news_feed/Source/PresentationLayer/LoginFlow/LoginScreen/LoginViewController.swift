//
//  LoginViewController.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIKit
import UIComponents

protocol LoginViewControllerInput {}

protocol LoginViewControllerOutput: class {
    func loginVCDidFinish(_ vc: LoginViewControllerInput)
    func loginVCDidTapVKLogin(_ vc: LoginViewControllerInput)
    func loginVCDidTapInstagramLogin(_ vc: LoginViewControllerInput)
}

class LoginViewController: UIViewController, LoginViewControllerInput, FeedbackViewController {
    
    typealias TEvent = Event
    typealias TState = State
    
    weak var output: LoginViewControllerOutput?
    
    // MAR: - DI
    var interactor: LoginInteractor
    var listFactory: LoginListFactory
    
    // MARK: - props
    var dispatchQueue: DispatchQueue
    var oldState: State
    var state: State
    var listAdapter: CollectionViewAdapter!
    
    init(interactor: LoginInteractor, listFactory: LoginListFactory) {
        self.interactor = interactor
        self.listFactory = listFactory
        
        dispatchQueue = DispatchQueue(label: "ru.togishiro.LoginViewController")
        
        oldState = Self.initialState()
        state = oldState
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = LoginView(frame: UIScreen.main.bounds)
    }
    
    var viewCasted: LoginView {
        return view as! LoginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listAdapter = CollectionViewAdapter(collectionView: viewCasted.collectionView)
        bindUI(to: state, oldState: state)
    }
    
    // MARK: -
    func handleOutput(_ outputEvent: State.Output) {
        switch outputEvent {
        case .didTapContinue:
            output?.loginVCDidFinish(self)
            
        case .didTapVKLogin:
            print(output)
            output?.loginVCDidTapVKLogin(self)
            
        case .didTapInstagramLogin:
            output?.loginVCDidTapInstagramLogin(self)
        }
    }
    
    func handleAction(_ actionEvent: State.Action) {
        
    }
}
