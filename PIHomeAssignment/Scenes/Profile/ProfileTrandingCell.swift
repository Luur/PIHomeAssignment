//
//  ProfileTrandingCell.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct ProfileTrandingCell: View {
    
    let currency: Currency
    
    var body: some View {
        
        VStack(spacing: 14) {
            
            HStack(spacing: 10) {
                
                currency.icon
                    .resizable()
                    .frame(width: 36, height: 36)
                
                VStack(alignment: .leading) {
                    
                    Text(currency.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text(currency.shortName)
                        .font(.system(size: 12))
                        .foregroundColor(R.color.spun_pearl.swiftUI)
                }
                
                Spacer()
            }
            
            if let chartImage = currency.chartImage {
                chartImage.resizable().frame(height: 41)
            }
            
            HStack {
                
                Text(currency.formattedPrice)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(spacing: 0) {
                    
                    R.image.profile_pointer.swiftUI.foregroundColor(currency.direction.forgroundColor).rotationEffect(.radians(currency.direction == .up ? .pi : 0))
                    
                    Text(currency.formattedPercentage)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(currency.direction.forgroundColor)
                }
            }
        }
        .frame(width: 195)
        .padding(16)
        .background(Color.white.opacity(0.12))
        .cornerRadius(18)
    }
}
