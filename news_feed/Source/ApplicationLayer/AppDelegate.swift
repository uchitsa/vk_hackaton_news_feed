//
//  AppDelegate.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import UIKit
import CoreData
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let syncResolver: Resolver = Container(defaultObjectScope: .transient) { container in
        let assemblies: [SwinjectAssembly] = [ApplicationLayerAssembly(),
                                              ServiceLayerAssembly(),
                                              DataLayerAssembly(),
                                              DomainLayerAssembly(),
                                              PresentationLayerAssembly()]
        for assembly in assemblies {
            assembly.configure(container)
        }
    }.synchronize()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let coordinator = syncResolver.resolve(AppCoordinator.self)!
        coordinator.start()
        
        return true
    }
}

