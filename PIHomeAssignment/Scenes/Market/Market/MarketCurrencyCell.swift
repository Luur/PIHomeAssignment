//
//  MarketCurrencyCell.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct MarketCurrencyCell: View {
    
    let currency: Currency
    let didSelect: () -> Void
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            currency.icon
                .resizable()
                .frame(width: 46, height: 46)
            
            VStack(alignment: .leading, spacing: 7) {
                
                Text(currency.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(currency.shortName)
                    .font(.system(size: 16))
                    .foregroundColor(R.color.spun_pearl.swiftUI)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 7) {
                
                Text(currency.formattedPrice)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(R.color.spun_pearl.swiftUI)
                
                Text(currency.formattedPercentageWithOperator)
                    .font(.system(size: 16))
                    .foregroundColor(currency.direction.forgroundColor)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: didSelect)
    }
}
