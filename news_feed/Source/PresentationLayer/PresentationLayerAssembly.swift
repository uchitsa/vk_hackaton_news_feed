//
//  PresentationLayerAssembly.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import Swinject

class PresentationLayerAssembly: SwinjectAssembly {
    func configure(_ container: Container) {
        container.register(VCFactory.self) { res in
            VCFactory(resolver: container.synchronize())
        }
        
        container.register(CoordinatorFactory.self) { res in
            CoordinatorFactory(resolver: container.synchronize())
        }
        
        configureCoordinators(container)
        configureScreens(container)
    }
    
    func configureScreens(_ container: Container) {
        [SwinjectAssembly](
            arrayLiteral:  FeedScreenAssembly()
        ).forEach { $0.configure(container) }
    }
    
    func configureCoordinators(_ container: Container) {
        [SwinjectAssembly](
            arrayLiteral: AppCoordinatorAssembly(),
                          LoginFlowCoordinatorAssembly(),
                          CitySelectionFlowCoordinatorAssembly(),
                          MainFlowCoordinatorAssembly()
        ).forEach { $0.configure(container) }
    }
}
