//
//  CitySelectionFlowCoordinator.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIKit

protocol CitySelectionFlowCoordinatorDelegate: class {
    func citySelectionFlowCoordinatorDidFinish(_ coordinator: CitySelectionFlowCoordinator)
}

class CitySelectionFlowCoordinator: BaseCoordinator<VCFactory, Void, UINavigationController> {
    
    weak var delegate: CitySelectionFlowCoordinatorDelegate?
    
    func start() {
        
    }
}
