//
//  OnboardingPageView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 13.10.2022.
//

import SwiftUI

struct OnboardingPageView: View {
    
    let image: Image
    let title: String
    let subtitle: String
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            image
            
            Spacer()
            
            VStack(spacing: 24) {
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .semibold))
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .foregroundColor(R.color.spun_pearl.swiftUI)
                    .font(.system(size: 16, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 56)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 42)
            .background(R.color.valhala.swiftUI)
            .cornerRadius(30)
            .padding(.horizontal, 20)
        }
        .padding(.bottom, 64)
    }
}
