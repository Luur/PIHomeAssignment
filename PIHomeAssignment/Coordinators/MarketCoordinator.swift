//
//  MarketCooridnator.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 14.10.2022.
//

import SwiftUI
import Stinsen
import Swinject

final class MarketCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \MarketCoordinator.start)
    
    @Root var start = makeStart
    @Route(.push) var currencyDetails = makeCurrencyDetails
    
    @ViewBuilder func makeStart() -> some View {
        let viewModel: MarketViewModel = DependencyInjectionContainer.shared.resolve()
        MarketView(viewModel: viewModel)
    }
    
    @ViewBuilder func makeCurrencyDetails(currency: Currency) -> some View {
        MarketCurrencyDetailsView(currency: currency)
    }
}
