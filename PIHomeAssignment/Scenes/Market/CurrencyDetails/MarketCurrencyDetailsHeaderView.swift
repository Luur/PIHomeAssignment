//
//  MarketCurrencyDetailsHeaderView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct MarketCurrencyDetailsHeaderView: View {
    
    let currency: Currency
    
    @ViewBuilder func dayAndNightMinMaxValueView(title: String, value: String) -> some View {
        
        VStack(spacing: 7) {
            
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(R.color.spun_pearl.swiftUI)
            
            Text(value)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
        }
    }
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            Spacer().frame(height: 84)
            
            Text(currency.formattedPrice)
                .font(.system(size: 32, weight: .semibold))
                .foregroundColor(.white)
            
            VStack(spacing: 26) {
                
                Text(currency.formattedPercentageWithOperator)
                    .font(.system(size: 16))
                    .foregroundColor(currency.direction.forgroundColor)
                
                HStack {
                    
                    Group {
                        
                        dayAndNightMinMaxValueView(title: R.string.localizable.market_currency_details_low(), value: currency.details.formattedDayAndNightMinValue)
                        
                        dayAndNightMinMaxValueView(title: R.string.localizable.market_currency_details_high(), value: currency.details.formattedDayAndNightMaxValue)
                        
                        dayAndNightMinMaxValueView(title: R.string.localizable.market_currency_details_volume(currency.shortName), value: currency.details.formattedVolume)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.bottom, 40)
        .background(R.color.valhala.swiftUI)
        .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
    }
}
