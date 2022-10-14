//
//  MarketCurrencyDetailsView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI

struct MarketCurrencyDetailsView: View {
    
    let currency: Currency
    
    var body: some View {
       
        ZStack {
            
            R.color.midnight_express.swiftUI
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                
                MarketCurrencyDetailsHeaderView(currency: currency)
                
                ScrollView {
                    
                    VStack(spacing: 40) {
                        Spacer().frame(height: 1)
                        MarketCurrencyDetailsAboutView(currency: currency)
                        MarketCurrencyDetailsFooterView(details: currency.details)
                    }
    
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationTitle("\(currency.shortName)/USD")
        .navigationBarTitleDisplayMode(.inline)
    }
}
