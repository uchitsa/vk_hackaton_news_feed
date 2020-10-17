//
//  MainFlowCoordinator.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIKit

protocol MainFlowCoordinatorDelegate: class {
    func mainFlowCoordinatorDidFinish(_ coordinator: MainFlowCoordinator)
}

class MainFlowCoordinator: BaseCoordinator<VCFactory, Void, UINavigationController>,
                           FeedViewControllerOutput {
    
    weak var delegate: MainFlowCoordinatorDelegate?
    
    func start() {
        showFeedScreen()
    }
    
    func showFeedScreen() {
        let vc = vcFactory.makeFeedViewController()
        vc.output = self
        
        router.setViewControllers([vc], animated: false)
    }
    
    // MARK: - FeedViewControllerOutput
    func feedVCDidFinish(_ vc: FeedViewControllerInput) {
        delegate?.mainFlowCoordinatorDidFinish(self)
    }
}
