//
//  SwinjectAssembly.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import Swinject

protocol SwinjectAssembly {
    func configure(_ container: Container)
}
