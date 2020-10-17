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

class LoginFlowCoordinator: BaseCoordinator<VCFactory, Void, UINavigationController> {
    
    weak var delegate: LoginFlowCoordinatorDelegate?
    
    func start() {
        
    }
}
