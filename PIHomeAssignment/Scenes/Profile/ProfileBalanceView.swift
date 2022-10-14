//
//  ProfileBalanceView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct ProfileBalanceView: View {
    
    let balance: String
    
    var body: some View {
        
        VStack(spacing: 32) {
            
            ZStack {
                
                Circle().fill(R.color.pink_gradient_right.swiftUI)
                    .frame(width: 90, height: 90)
                    .blur(radius: 20)
                
                R.color.valhala.swiftUI
                    .opacity(0.5)
                    .cornerRadius(90)
                
                Text(balance)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            }
            .frame(width: 180, height: 180)
            
            HStack(spacing: 10) {
                
                Group {
                    
                    Button(action: {}) {
                        Text(R.string.localizable.profile_deposit())
                        
                    }
                    
                    Button(action: {}) {
                        Text(R.string.localizable.profile_withdraw())
                    }
                }
                .frame(maxWidth: .infinity)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .frame(height: 48)
                .background(R.color.valhala.swiftUI)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Gradients.pink, lineWidth: 1)
                )
            }
        }
        .padding(.horizontal, 20)
    }
}

struct ProfileBalanceView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBalanceView(balance: "$246.00")
    }
}

