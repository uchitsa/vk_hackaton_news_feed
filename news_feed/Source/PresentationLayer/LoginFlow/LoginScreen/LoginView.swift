//
//  LoginView.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIKit

class LoginView: UIView {
    var ivHeader: UIImageView
    var collectionView: UICollectionView
    
    override init(frame: CGRect) {
        ivHeader = UIImageView(image: R.image.header())
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        super.init(frame: frame)
        
        addSubview(ivHeader)
        addSubview(collectionView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        ivHeader.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ivHeader.leadingAnchor.constraint(equalTo: leadingAnchor),
            ivHeader.trailingAnchor.constraint(equalTo: trailingAnchor),
            ivHeader.topAnchor.constraint(equalTo: topAnchor),
            
            collectionView.topAnchor.constraint(equalTo: ivHeader.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
