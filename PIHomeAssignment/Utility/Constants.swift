//
//  Constants.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 13.10.2022.
//

import SwiftUI

struct Gradients {
    
    static let pink = LinearGradient(gradient: Gradient(colors: [R.color.pink_gradient_left.swiftUI, R.color.pink_gradient_right.swiftUI]), startPoint: UnitPoint(x: 0.25, y: 0.5), endPoint: UnitPoint(x: 0.75, y: 0.5))
    
    static let bottomShadow = LinearGradient(gradient: Gradient(colors: [R.color.midnight_express.swiftUI.opacity(0), R.color.midnight_express.swiftUI.opacity(1)]), startPoint: UnitPoint(x: 0.5, y: 0.0), endPoint: UnitPoint(x: 0.5, y: 1.0))
}
