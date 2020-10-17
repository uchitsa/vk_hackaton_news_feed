//
//  DataLayerAssembly.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import Swinject
import RepositorySource

class DataLayerAssembly: SwinjectAssembly {
    func configure(_ container: Container) {
        container.register(PromisedCoreDataSource.self) { res in
            PromisedCoreDataSourceImpl(coreDataService: res.resolve(CoreDataService.self)!,
                                       importQueue: res.resolve(DispatchQueue.self)!,
                                       notificationCenter: res.resolve(NotificationCenter.self)!)
        }
        
//        container.register(PostsRepository.self) { res in
//            PostsRepositoryImpl(coreDataSource: res.resolve(PromisedCoreDataSource.self)!)
//        }
    }
}
