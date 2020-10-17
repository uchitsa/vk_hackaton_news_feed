//
//  AppCoordinatorInstructor.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation

extension AppCoordinator {
    enum LaunchOption {
        case login
        case citySelection
        case main
    }
}

class AppCoordinatorInstructor {
    func launchOption() -> AppCoordinator.LaunchOption {
        return .main
    }
}
