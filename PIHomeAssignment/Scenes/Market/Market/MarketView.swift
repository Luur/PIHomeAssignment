//
//  MarketView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI
import Stinsen

struct MarketView<ViewModel: MarketViewModelProtocol>: View {
    
    @EnvironmentObject private var router:  MarketCoordinator.Router
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
        ZStack {
            
            R.color.midnight_express.swiftUI
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                LazyVStack(spacing: 42) {
                    ForEach(viewModel.currencies) { currency in
                        MarketCurrencyCell(currency: currency) {
                            router.route(to: \.currencyDetails, currency)
                        }
                    }
                }
                .padding(20)
            }
            .clipped()
            .emptyDataView(condition: viewModel.currencies.isEmpty) {
                Text(R.string.localizable.empty_state_currencies())
            }
        }
        .onFirstAppear(perform: viewModel.fetchCurrencies)
        .navigationBarHidden(true)
    }
}
