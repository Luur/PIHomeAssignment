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
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().backgroundColor = R.color.valhala()
    }
    
    @ViewBuilder func makeProfile() -> some View {
        Color.green
    }
    
    @ViewBuilder func makeMarket() -> some View {
        Color.green
    }
                                          
    @ViewBuilder func makeProfileTab(isActive: Bool) -> some View {
        Image(isActive ? R.image.tabbar_profile_active.name : R.image.tabbar_profile_unactive.name)
    }
    
    @ViewBuilder func makeMarketTab(isActive: Bool) -> some View {
        Image(isActive ? R.image.tabbar_market_active.name : R.image.tabbar_market_unactive.name)
    }
}
