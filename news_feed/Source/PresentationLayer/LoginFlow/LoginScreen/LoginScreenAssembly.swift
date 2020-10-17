//
//  LoginScreenAssembly.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import Swinject

class LoginScreenAssembly: SwinjectAssembly {
    func configure(_ container: Container) {
        container.register(LoginViewController.self) { res in
            LoginViewController(interactor: res.resolve(LoginInteractor.self)!,
                                listFactory: res.resolve(LoginListFactory.self)!)
        }
        
        container.register(LoginInteractor.self) { res in
            LoginInteractorImpl()
        }
        
        container.register(LoginListFactory.self) { res in
            LoginListFactory()
        }
    }
}
