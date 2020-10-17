//
//  BaseCoordinator.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIKit

class BaseCoordinator<TVCFactory, TCoordinatorFactory, TRouter>: Coordinator, CoordinatorWithStorage {
    // MARK: - DI
    let vcFactory: TVCFactory
    let coordinatorFactory: TCoordinatorFactory
    let router: TRouter
        
    // MARK: - props
    var storage: Storage
    
    init(vcFactory: TVCFactory, coordinatorFactory: TCoordinatorFactory, router: TRouter) {
        self.vcFactory = vcFactory
        self.coordinatorFactory = coordinatorFactory
        self.router = router
        
        storage = Storage()
    }
}
