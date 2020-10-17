//
//  CoordinatorWithStorage.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation

protocol CoordinatorWithStorage {
    var storage: Storage { get }
}

class Storage {
    var coordinators: [Coordinator] = []
    
    func add(_ coordinator: Coordinator) {
        coordinators.append(coordinator)
    }
    
    public func remove(_ coordinator: Coordinator) {
        guard let index = coordinators.firstIndex(where: { $0 === coordinator }) else { return }
        coordinators.remove(at: index)
    }
}
