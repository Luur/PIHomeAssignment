//
//  TabBarCoordinator.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 13.10.2022.
//

import SwiftUI
import Stinsen

final class TabBarCoordinator: TabCoordinatable {
    
    var child: TabChild

    @Route(tabItem: makeProfileTab) var profile = makeProfile
    @Route(tabItem: makeMarketTab) var market = makeMarket
    
    init() {
        child = TabChild(startingItems: [\TabBarCoordinator.profile, \TabBarCoordinator.market])
        //UITabBar.configureAppearance()
    }
    
    @ViewBuilder func makeProfile() -> some View {
        Color.green
    }
    
    @ViewBuilder func makeMarket() -> some View {
        Color.green
    }
                                          
    @ViewBuilder func makeProfileTab(isActive: Bool) -> some View {
        Image(systemName: "star")
        Text("Profile")
    }
    
    @ViewBuilder func makeMarketTab(isActive: Bool) -> some View {
        Image(systemName: "xmark.circle")
        Text("Market")
    }
}
