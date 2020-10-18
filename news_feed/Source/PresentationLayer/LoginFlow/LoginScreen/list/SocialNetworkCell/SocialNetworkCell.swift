//
//  SocialNetworkCell.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIComponents
import UIKit

class CollectionItemSocialNetworkCell: CollectionItem<SocialNetworkCell> {}

class SocialNetworkCell: BaseCollectionCell, ConfigurableCell {
    typealias ViewModelType = SocialNetworkCellVM
    
    @IBOutlet weak var ivIcon: UIImageView!
    
    static var cellNib: UINib? {
        return UINib(resource: R.nib.socialNetworkCell)
    }
    
    var viewModel: SocialNetworkCellVM?
    
    func configure(with viewModel: SocialNetworkCellVM) {
        ivIcon.image = viewModel.image
    }
}
