//
//  OnFirstAppearModifier.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 16.10.2022.
//

import SwiftUI

private struct OnFirstAppearModifier: ViewModifier {
    let perform: () -> Void
    
    @State private var onAppearCalled: Bool = false
    
    func body(content: Content) -> some View {
        content.onAppear {
            guard !onAppearCalled else { return }
            onAppearCalled = true
            perform()
        }
    }
}

extension View {
    func onFirstAppear(perform: @escaping () -> Void) -> some View {
        modifier(OnFirstAppearModifier(perform: perform))
    }
}

