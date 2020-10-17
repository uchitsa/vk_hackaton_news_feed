//
//  MainFlowCoordinatorAssembly.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import Swinject

class MainFlowCoordinatorAssembly: SwinjectAssembly {
    func configure(_ container: Container) {
        container.register(MainFlowCoordinator.self) { res, navCtrl in
            MainFlowCoordinator(vcFactory: res.resolve(VCFactory.self)!,
                                coordinatorFactory: (),
                                router: navCtrl)
        }
    }
}
