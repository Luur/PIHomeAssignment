//
//  MarketCurrencyDetailsCalculatorView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import SwiftUI

struct MarketCurrencyDetailsCalculatorView: View {
    
    let currency: Currency
    
    var body: some View {
        
        VStack(spacing: 32) {
            
            MarketCurrencyDetailsCalculatorTextField(currency: currency.shortName, available: "0 \(currency.shortName)")
            
            MarketCurrencyDetailsCalculatorTextField(currency: "USD", available: "0 USD")
            
            HStack(spacing: 10) {
                
                MarketCurrencyDetailsCalculatorButton(title: R.string.localizable.market_currency_details_buy(currency.shortName), subtitle: R.string.localizable.market_currency_details_buy_button_subtitle(currency.shortName))
                
                MarketCurrencyDetailsCalculatorButton(title: R.string.localizable.market_currency_details_sell(currency.shortName), subtitle: R.string.localizable.market_currency_details_sell_button_subtitle(currency.shortName))
            }
        }
    }
}
