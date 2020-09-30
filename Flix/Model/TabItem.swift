//
//  TabItem.swift
//  Flix
//
//  Created by Lillian Chen on 9/30/20.
//

import Foundation

struct TabItem: Hashable {
    let title: String
    let imageName: String
    let type: TabItemType
    
    enum TabItemType {
        case nowPlaying
        case superHero
    }
}
