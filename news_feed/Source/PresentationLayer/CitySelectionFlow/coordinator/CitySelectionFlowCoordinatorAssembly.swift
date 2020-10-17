//
//  CitySelectionFlowCoordinatorAssembly.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import Swinject

class CitySelectionFlowCoordinatorAssembly: SwinjectAssembly {
    func configure(_ container: Container) {
        container.register(CitySelectionFlowCoordinator.self) { res, navCtrl in
            CitySelectionFlowCoordinator(vcFactory: res.resolve(VCFactory.self)!,
                                         coordinatorFactory: (),
                                         router: navCtrl)
        }
    }
}
