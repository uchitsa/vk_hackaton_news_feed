//
//  FeedView.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIKit

class FeedView: UIView {
    var tableView: UITableView
    
    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero)
        super.init(frame: frame)
        
        addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        tableView.frame = bounds
    }
}
