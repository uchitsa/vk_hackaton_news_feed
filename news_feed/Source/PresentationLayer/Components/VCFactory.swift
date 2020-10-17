//
//  VCFactory.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import Swinject

class VCFactory {
    var resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func makeFeedViewController() -> FeedViewController {
        resolver.resolve(FeedViewController.self)!
    }
    
    func makeLoginViewController() -> LoginViewController {
        resolver.resolve(LoginViewController.self)!
    }
    
    func makeVKLoginViewController() -> VKLoginViewController {
        resolver.resolve(VKLoginViewController.self)!
    }
}
