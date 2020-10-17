//
//  Login+Bindings.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation

extension LoginViewController {
    func bindUI(to state: State, oldState: State) {
        listAdapter.reload(with: listFactory.makeList(for: state, holder: self),
                           completion: { _ in })
    }
}
