//
//  AppCoordinatorAssembly.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import Swinject

class AppCoordinatorAssembly: SwinjectAssembly {
    func configure(_ container: Container) {
        container.register(AppCoordinator.self) { res in
            AppCoordinator(coordinatorFactory: res.resolve(CoordinatorFactory.self)!,
                           router: res.resolve(UIWindow.self)!,
                           instructor: res.resolve(AppCoordinatorInstructor.self)!)
        }.inObjectScope(.container)
        
        container.register(AppCoordinatorInstructor.self) { res in
            AppCoordinatorInstructor()
        }
    }
}
