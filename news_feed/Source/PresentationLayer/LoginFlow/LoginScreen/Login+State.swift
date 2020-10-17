//
//  Login+State.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIKit

extension LoginViewController {
    struct State: FeedbackVCState {
        typealias TAction = Action
        typealias TOutput = Output
        typealias TRequest = Request
        
        enum Action: Hashable {}
        
        enum Output {
            case didTapContinue
            case didTapVKLogin
            case didTapInstagramLogin
        }
        
        enum Request: Hashable {}
        
        struct Flags: Equatable {
            var showVKButton: Bool
            var showTwitterButton: Bool
            var showInstagramButton: Bool
            var showTelegramButton: Bool
        }
        
        var actions: Set<Action>
        var output: Output?
        var requests: Set<Request>
        
        var flags: Flags
    }
    
    static func initialState() -> State {
        State(actions: [],
              output: nil,
              requests: [],
              flags: State.Flags(showVKButton: true,
                                 showTwitterButton: true,
                                 showInstagramButton: true,
                                 showTelegramButton: true))
    }
}
