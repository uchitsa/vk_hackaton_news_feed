//
//  FeedScreenAssembly.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import Swinject

class FeedScreenAssembly: SwinjectAssembly {
    func configure(_ container: Container) {
        container.register(FeedViewController.self) { res in
            FeedViewController(interactor: res.resolve(FeedInteractor.self)!)
        }
        
        container.register(FeedInteractor.self) { res in
            FeedInteractorImpl()
        }
    }
}
