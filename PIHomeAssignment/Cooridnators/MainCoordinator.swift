//
//  MainCoordinator.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 13.10.2022.
//

import SwiftUI
import Stinsen

final class MainCoordinator: NavigationCoordinatable {
    
    var stack: Stinsen.NavigationStack<MainCoordinator>
    
    @Root var tabBar = makeTabBar
    @Root var onboarding = makeOnboarding
    
    init() {
        stack = NavigationStack(initial: \MainCoordinator.onboarding)
        if OnboardingPresentationManager.shared.isOnboardingPresented {
            stack = NavigationStack(initial: \MainCoordinator.tabBar)
        } else {
            stack = NavigationStack(initial: \MainCoordinator.onboarding)
        }
    }
    
    @ViewBuilder func customize(_ view: AnyView) -> some View {
        view
            .onReceive(OnboardingPresentationManager.shared.$isOnboardingPresented.dropFirst(), perform: { isAppOnboardingPresented in
                if isAppOnboardingPresented {
                    self.root(\.tabBar)
                } else {
                    self.root(\.onboarding)
                }
            })
    }
    
    @ViewBuilder func makeOnboarding() -> some View {
        OnboardingView()
    }
    
    func makeTabBar() -> TabBarCoordinator {
        return TabBarCoordinator()
    }
}
