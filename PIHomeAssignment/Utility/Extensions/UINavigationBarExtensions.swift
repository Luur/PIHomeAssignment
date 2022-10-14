//
//  UINavigationBarExtension.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import UIKit

extension UINavigationBar {
    
    static func configureAppearanceWithTransparentBackground() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()
        navigationBarAppearance.setBackIndicatorImage(backButtonImage(), transitionMaskImage: backButtonImage())
        navigationBarAppearance.backButtonAppearance = backButtonAppearance()
        appearance().standardAppearance = navigationBarAppearance
        appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    private static func backButtonAppearance() -> UIBarButtonItemAppearance {
        let appearance = UIBarButtonItemAppearance(style: .plain)
        appearance.focused.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        return appearance
    }
    
    private static func backButtonImage() -> UIImage? {
        UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
    }
}
