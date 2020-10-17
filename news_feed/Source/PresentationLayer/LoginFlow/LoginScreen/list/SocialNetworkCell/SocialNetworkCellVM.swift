//
//  SocialNetworkCellVM.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIComponents

class SocialNetworkCellVM: CollectionCellVM, Equatable {
    var image: UIImage
    
    init(image: UIImage) {
        self.image = image
        super.init(action: nil, userInfo: nil)
    }

    override var defaultSize: CGSize? {
        let width = (UIScreen.main.bounds.width - 48) / 2
        let height = width / 3.022
        
        return CGSize(width: width,
                      height: height)
    }
    
    static func == (lhs: SocialNetworkCellVM, rhs: SocialNetworkCellVM) -> Bool {
        return lhs.image == rhs.image
    }
}
