//
//  MarketView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI
import Stinsen

struct MarketView: View {
    
    @EnvironmentObject private var router:  MarketCoordinator.Router
    
    var body: some View {
        
        ZStack {
            
            R.color.midnight_express.swiftUI
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                LazyVStack(spacing: 42) {
                    ForEach(Currency.all) { currency in
                        MarketCurrencyCell(currency: currency) {
                            router.route(to: \.currencyDetails, currency)
                        }
                    }
                }
                .padding(20)
            }
            .clipped()
        }
        .navigationBarHidden(true)
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}
