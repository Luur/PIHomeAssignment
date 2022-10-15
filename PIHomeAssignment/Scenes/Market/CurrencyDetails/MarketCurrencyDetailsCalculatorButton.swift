//
//  MarketCurrencyDetailsCalculatorButton.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 16.10.2022.
//

import SwiftUI

struct MarketCurrencyDetailsCalculatorButton: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        
        Button(action: {}) {
            
            VStack(spacing: 2) {
                
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .lineLimit(1)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(R.color.valhala.swiftUI)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Gradients.pink, lineWidth: 1)
        )
    }
}

