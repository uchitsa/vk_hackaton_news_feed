//
//  PostManaged.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import RepositorySource

extension PostManaged: Mappable {
    public static func defaultMapping() -> Mapping {
        let mapping = Mapping(className: "PostManaged", primaryKey: "identifier")
        
        return mapping
    }
}
