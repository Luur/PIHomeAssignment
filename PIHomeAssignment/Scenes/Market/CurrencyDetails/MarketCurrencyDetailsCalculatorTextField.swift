//
//  MarketCurrencyDetailsCalculatorTextField.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 16.10.2022.
//

import SwiftUI

struct MarketCurrencyDetailsCalculatorTextField: View {
    
    @State private var text: String = ""
    let currency: String
    let available: String
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 6) {
            
            HStack {
                
                TextField("0", text: $text)
                    .keyboardType(.decimalPad)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(height: 24)
                    .frame(maxWidth: .infinity)
                
                Text(currency)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
            }
            
            Gradients.pink.frame(height: 1)
            
            Text(R.string.localizable.market_currency_details_available(available))
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(R.color.spun_pearl.swiftUI)
        }
    }
}
