//
//  PIHomeAssignmentApp.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 13.10.2022.
//

import SwiftUI

@main
struct PIHomeAssignmentApp: App {
    
    init() {
        _ = DependencyInjectionContainer.shared
    }
    
    var body: some Scene {
        WindowGroup {
            MainCoordinator().view()
        }
    }
}
