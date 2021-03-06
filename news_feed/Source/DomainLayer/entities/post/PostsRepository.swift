//
//  PostRepository.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import RepositorySource
import PromiseKit

protocol PostsRepository {
    func localPostsFRC() -> PromisedRepositoryFRC
}
