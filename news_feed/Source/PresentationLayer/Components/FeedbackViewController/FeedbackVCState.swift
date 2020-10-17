//
//  State.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation

protocol FeedbackVCState {
    associatedtype TAction: Hashable
    associatedtype TOutput
    associatedtype TRequest: Hashable
    
    var actions: Set<TAction> { get set }
    var output: TOutput? { get set }
    var requests: Set<TRequest> { get set }
}
