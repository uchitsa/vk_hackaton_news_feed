//
//  Feed+State.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIKit

extension FeedViewController {
    struct State: FeedbackVCState {
        typealias TAction = Action
        typealias TOutput = Output
        typealias TRequest = Request
        
        enum Action: Hashable {
        }
        
        enum Output {
            
        }
        
        enum Request: Hashable {
            
        }
        
        var actions: Set<Action>
        var output: Output?
        var requests: Set<Request>
    }
    
    static func initialState() -> State {
        State(actions: [], output: nil, requests: [])
    }
}
