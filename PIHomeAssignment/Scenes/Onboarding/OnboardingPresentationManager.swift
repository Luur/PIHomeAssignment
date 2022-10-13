//
//  OnboardingPresentationManager.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 13.10.2022.
//

import SwiftUI

class OnboardingPresentationManager: ObservableObject {
    
    static let shared: OnboardingPresentationManager = OnboardingPresentationManager()
    private init() {
        isOnboardingPresented = UserDefaults.isOnboardingPresented
    }
    
    @Published var isOnboardingPresented: Bool {
        willSet { UserDefaults.isOnboardingPresented = newValue }
    }
}
