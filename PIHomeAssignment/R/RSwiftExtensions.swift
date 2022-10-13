//
//  RSwiftExtensions.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 13.10.2022.
//

import SwiftUI
import Rswift

// MARK: - ImageResource
extension ImageResource {
    var swiftUI: Image {
        Image(name)
    }
}

// MARK: - ColorResource
extension ColorResource {
    var swiftUI: Color {
        Color(name)
    }
}

