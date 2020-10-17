//
//  LoginCellVMFactory.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import Foundation
import UIComponents

class LoginListFactory {
    typealias State = LoginViewController.State
    typealias Holder = LoginViewController
    
    enum Section: String {
        case main
        
        func cells() -> [Cell] {
            return [.vk, .instagram, .twitter, .telegram]
        }
    }
    
    enum Cell: String {
        case vk, instagram, twitter, telegram
    }
    
    func makeList(for state: State, holder: Holder) -> CollectionList {
        let list = CollectionList()
        
        let section = CollectionSection(with: Section.main.rawValue)
        let rows = Section.main.cells()
            .compactMap { makeItem(cell: $0, state: state, holder: holder) }
        
        section.append(rows: rows)
        section.insets = UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16)
        list.sections = [section]
        
        return list
    }
    
    func makeItem(cell: Cell, state: State, holder: Holder) -> CollectionItemConfigurable? {
        guard let cellVM = makeCellVM(for: cell,
                                      state: state,
                                      holder: holder) else { return nil }
        
        switch cellVM {
        case let cellVM as SocialNetworkCellVM:
            return CollectionItemSocialNetworkCell(id: cell.rawValue, viewModel: cellVM)
        default:
            fatalError()
        }
    }
    
    func makeCellVM(for cell: Cell, state: State, holder: Holder) -> CollectionCellVM? {
        let image: UIImage
        let event: Holder.Event
        
        switch cell {
        case .vk:
            image = R.image.vkImage()!
            event = .didTapVKLogin
            
        case .instagram:
            image = R.image.vkImage()!
            event = .didTapInstagramLogin
            
        case .twitter:
            image = R.image.vkImage()!
            event = .didTapTwitterLogin
            
        case .telegram:
            image = R.image.vkImage()!
            event = .didTapTelegramLogin
        }
        
        let cellVM =  SocialNetworkCellVM(image: image)
        
        cellVM.action = { [weak holder] _ in
            guard let __holder = holder else { return }
            __holder.acceptEvent(event)
        }
        
        return cellVM
    }
}
