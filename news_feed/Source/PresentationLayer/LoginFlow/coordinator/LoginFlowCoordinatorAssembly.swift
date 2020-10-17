//
//  LoginFlowCoordinatorAssembly.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import Swinject

class LoginFlowCoordinatorAssembly: SwinjectAssembly {
    func configure(_ container: Container) {
        container.register(LoginFlowCoordinator.self) { res, navCtrl in
            LoginFlowCoordinator(vcFactory: res.resolve(VCFactory.self)!,
                                 coordinatorFactory: (),
                                 router: navCtrl,
                                 appConfig: res.resolve(AppConfig.self)!)
        }
    }
}
