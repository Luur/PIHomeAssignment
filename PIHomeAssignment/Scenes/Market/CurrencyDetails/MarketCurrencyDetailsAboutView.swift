//
//  MarketCurrencyDetailsAboutView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import SwiftUI

struct MarketCurrencyDetailsAboutView: View {
    
    let currency: Currency
    
    var body: some View {
        
            
        VStack(alignment: .leading, spacing: 20) {
                
            SectionHeaderView(image: R.image.market_details_money.swiftUI, title: R.string.localizable.market_currency_details_about(currency.shortName))
                
            VStack(spacing: 10) {
                
                ZStack {
                    
                    Text(currency.details.description)
                        .font(Font.system(size: 14))
                        .foregroundColor(.white)
                    
                    Gradients.bottomShadow
                }
                
                Button(action: {}) {
                    Gradients.pink
                        .mask(
                            Text(R.string.localizable.market_currency_details_show_more())
                                .font(Font.system(size: 16, weight: .semibold))
                        )
                }
                .frame(maxWidth: .infinity)
                .frame(height: 20)
            }
        }
        .padding(.horizontal)
    }
}
