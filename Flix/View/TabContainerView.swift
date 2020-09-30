//
//  TabContainerView.swift
//  Flix
//
//  Created by Lillian Chen on 9/30/20.
//

import SwiftUI

struct TabContainerView: View {
    
    @StateObject private var tabContainerViewModel = TabContainerViewModel()
    
    var body: some View {
        TabView(selection: $tabContainerViewModel.selectedTab) {
            ForEach(tabContainerViewModel.tabbarItems, id: \.self) { tabItem in
                tabView(for: tabItem.type)
                    .tabItem {
                        Image(systemName: tabItem.imageName)
                        Text(tabItem.title)
                    }.tag(tabItem.type)
            }
        }
    }
    
    @ViewBuilder
    func tabView(for tabItemType: TabItem.TabItemType) -> some View {
        switch tabItemType {
        case .nowPlaying:
            NavigationView {
                MovieListView()
            }
        case .superHero:
            NavigationView {
                MovieCollectionView()
            }
        }
    }
}

struct TabContainerView_Previews: PreviewProvider {
    static var previews: some View {
        TabContainerView()
    }
}
