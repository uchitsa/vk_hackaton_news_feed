//
//  MainCoordinator.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator<Void, CoordinatorFactory, UIWindow>,
                      LoginFlowCoordinatorDelegate,
                      CitySelectionFlowCoordinatorDelegate,
                      MainFlowCoordinatorDelegate {
    
    var instructor: AppCoordinatorInstructor
    
    init(coordinatorFactory: CoordinatorFactory,
         router: UIWindow,
         instructor: AppCoordinatorInstructor) {
        self.instructor = instructor
        super.init(vcFactory: (), coordinatorFactory: coordinatorFactory, router: router)
        
        router.makeKeyAndVisible()
    }
    
    func start() {
        let launchOption = instructor.launchOption()
        
        let navCtrl = UINavigationController()
        
        router.rootViewController = navCtrl
        
        switch launchOption {
        case .citySelection:
            startCitySelectionFlow(router: navCtrl)
        case .login:
            startLoginFlow(router: navCtrl)
        case .main:
            startMainFlow(router: navCtrl)
        }
    }
    
    
    // MARK: -
    func startLoginFlow(router: UINavigationController) {
        let coordinator = coordinatorFactory.makeLoginFlowCoordinator(router: router)
        coordinator.delegate = self
        storage.add(coordinator)
        
        coordinator.start()
    }
    
    func startCitySelectionFlow(router: UINavigationController) {
        let coordinator = coordinatorFactory.makeCitySelectionFlowCoordinator(router: router)
        coordinator.delegate = self
        storage.add(coordinator)
        
        coordinator.start()
    }
    
    func startMainFlow(router: UINavigationController) {
        let coordinator = coordinatorFactory.makeMainFlowCoordinator(router: router)
        coordinator.delegate = self
        storage.add(coordinator)
        
        coordinator.start()
    }
    
    // MARK: - LoginFlowCoordinatorDelegate
    func loginFlowCoordinatorDidFinish(_ coordinator: LoginFlowCoordinator) {
        start()
    }
    
    // MARK: - CitySelectionFlowCoordinatorDelegate
    func citySelectionFlowCoordinatorDidFinish(_ coordinator: CitySelectionFlowCoordinator) {
        start()
    }
    
    // MARK: - MainFlowCoordinatorDelegate
    func mainFlowCoordinatorDidFinish(_ coordinator: MainFlowCoordinator) {
        start()
    }
}
