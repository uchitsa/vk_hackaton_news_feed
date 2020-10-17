//
//  VKLoginAssembly.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import Swinject
import FoundationExtension

class VKLoginAssebly: SwinjectAssembly {
    func configure(_ container: Container) {
        container.register(VKLoginViewController.self) { res in
            VKLoginViewController(dialogService: res.resolve(DialogService.self)!)
        }
    }
}
