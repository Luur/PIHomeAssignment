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
        UITabBar.configureAppearance()
        UINavigationBar.configureAppearanceWithTransparentBackground()
    }
    
    private func backButtonImage() -> UIImage? {
        UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
    }
    
    private func backButtonAppearance() -> UIBarButtonItemAppearance {
        let appearance = UIBarButtonItemAppearance(style: .plain)
        appearance.focused.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        return appearance
    }
    
    @ViewBuilder func makeProfile() -> some View {
        ProfileView()
    }
    
    func makeMarket() -> NavigationViewCoordinator<MarketCoordinator> {
        return NavigationViewCoordinator(MarketCoordinator())
    }
                                          
    @ViewBuilder func makeProfileTab(isActive: Bool) -> some View {
        Image(isActive ? R.image.tabbar_profile_active.name : R.image.tabbar_profile_unactive.name)
    }
    
    @ViewBuilder func makeMarketTab(isActive: Bool) -> some View {
        Image(isActive ? R.image.tabbar_market_active.name : R.image.tabbar_market_unactive.name)
    }
}
