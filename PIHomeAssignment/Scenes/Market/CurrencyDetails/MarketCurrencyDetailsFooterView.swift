//
//  MarketCurrencyDetailsFooterView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import SwiftUI

struct MarketCurrencyDetailsFooterView: View {
    
    let details: Currency.Details
    
    @ViewBuilder func footerItemView(title: String, subtitle: String) -> some View {
        
        HStack {
            
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
            
            Spacer()
            
            Text(subtitle)
                .font(.system(size: 16))
                .foregroundColor(R.color.spun_pearl.swiftUI)
        }
    }
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            Group {
                
                footerItemView(title: R.string.localizable.market_currency_details_rank(), subtitle: details.formattedRank)
                
                footerItemView(title: R.string.localizable.market_currency_details_launch_date(), subtitle: details.formattedLaunchDate)
            }
            .frame(height: 47)
            .padding(.horizontal, 14)
            .background(R.color.valhala.swiftUI)
            .cornerRadius(12)
        }
    }
}
