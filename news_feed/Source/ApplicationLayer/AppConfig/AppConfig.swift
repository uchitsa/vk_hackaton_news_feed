//
//  AppConfig.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation

class AppConfig {
    var vkAppId: String = "7631790"
    var url = URLS()
    
    class URLS {
        var vkLoginPath = URL(correctPath: "https://oauth.vk.com/authorize?client_id=7631790&display=page&redirect_uri=vk7631790://callback&scope=friends&response_type=token&v=5.124&state=123456")
    }
}
