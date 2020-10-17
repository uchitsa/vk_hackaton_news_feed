//
//  CoordinatorFactory.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import Swinject
import UIKit

class CoordinatorFactory {
    fileprivate var resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    // MARK: -
    func makeLoginFlowCoordinator(router: UINavigationController) -> LoginFlowCoordinator {
        resolver.resolve(LoginFlowCoordinator.self, argument: router)!
    }
    
    func makeCitySelectionFlowCoordinator(router: UINavigationController) -> CitySelectionFlowCoordinator {
        resolver.resolve(CitySelectionFlowCoordinator.self, argument: router)!
    }
    
    func makeMainFlowCoordinator(router: UINavigationController) -> MainFlowCoordinator {
        resolver.resolve(MainFlowCoordinator.self, argument: router)!
    }
}
