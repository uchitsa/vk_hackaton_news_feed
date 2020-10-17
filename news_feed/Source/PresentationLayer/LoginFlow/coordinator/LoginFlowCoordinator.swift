//
//  LoginFlowCoordinator.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIKit

protocol LoginFlowCoordinatorDelegate: class {
    func loginFlowCoordinatorDidFinish(_ coordinator: LoginFlowCoordinator)
}

class LoginFlowCoordinator: BaseCoordinator<VCFactory, Void, UINavigationController>,
                            LoginViewControllerOutput,
                            VKLoginVCOutput {
    
    var appConfig: AppConfig
    
    init(vcFactory: VCFactory,
         coordinatorFactory: Void,
         router: UINavigationController,
         appConfig: AppConfig) {
        self.appConfig = appConfig
        
        super.init(vcFactory: vcFactory, coordinatorFactory: coordinatorFactory, router: router)
    }
    
    weak var delegate: LoginFlowCoordinatorDelegate?
    
    func start() {
        router.navigationBar.isHidden = true
        showLoginScreen()
    }
    
    func showLoginScreen() {
        let vc = vcFactory.makeLoginViewController()
        vc.output = self
        
        router.setViewControllers([vc], animated: false)
    }
    
    func showVKLoginScreen() {
        print("showVKLoginScreen")
        let vc = vcFactory.makeVKLoginViewController()
        vc.output = self
        vc.open(url: appConfig.url.vkLoginPath)
        
        router.pushViewController(vc, animated: true)
    }
    
    func showInstagramLoginScreen() {
        print("showVKLoginScreen")
        let vc = vcFactory.makeVKLoginViewController()
        vc.output = self
        vc.open(url: appConfig.url.vkLoginPath)
        
        router.pushViewController(vc, animated: true)
    }
    
    // MARK: - FeedViewControllerOutput
    func loginVCDidFinish(_ vc: LoginViewControllerInput) {
        showVKLoginScreen()
    }
    
    func loginVCDidTapVKLogin(_ vc: LoginViewControllerInput) {
        print("loginVCDidTapVKLogin")
        showVKLoginScreen()
    }
    
    func loginVCDidTapInstagramLogin(_ vc: LoginViewControllerInput) {
        showInstagramLoginScreen()
    }
    
    // MARK: - VKLoginVCOutput
    func vkLoginVC(_ vc: VKLoginVCInput, shouldRedirectTo url: URL) -> Bool {
        print(url)
        return true
    }
}
