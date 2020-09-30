//
//  TabContainerViewModel.swift
//  Flix
//
//  Created by Lillian Chen on 9/30/20.
//

import Foundation

final class TabContainerViewModel: ObservableObject {
    
    @Published  var selectedTab: TabItem.TabItemType = .nowPlaying
    
    let tabbarItems: [TabItem] = [
        TabItem(title: "Now Playing", imageName: "film", type: .nowPlaying),
        TabItem(title: "Superhero", imageName: "bolt.circle", type: .superHero)
    ]
    
}
