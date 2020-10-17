//
//  Login+Reducer.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation

extension LoginViewController {
    enum Event {
        case didTapVKLogin
        case didTapTelegramLogin
        case didTapTwitterLogin
        case didTapInstagramLogin
    }
    
    static func reduce(_ event: Event, _ state: State) -> State {
        var state = state
        
        switch event {
        case .didTapVKLogin:
            state.output = .didTapVKLogin
            
        case .didTapTwitterLogin:
            break
            
        case .didTapTelegramLogin:
            break
            
        case .didTapInstagramLogin:
            break
        }
        
        return state
    }
}
