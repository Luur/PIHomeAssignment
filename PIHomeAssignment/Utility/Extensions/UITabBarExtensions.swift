//
//  UITabBarExtensions.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import UIKit

extension UITabBar {
    
    static func configureAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = R.color.valhala()
        appearance().standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}
