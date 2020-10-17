//
//  ApplicationLayerAssembly.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import Swinject
import UIKit

class ApplicationLayerAssembly: SwinjectAssembly {
    func configure(_ container: Container) {
        container.register(UIWindow.self) { res in
            UIWindow()
        }.inObjectScope(.container)
    }
}
