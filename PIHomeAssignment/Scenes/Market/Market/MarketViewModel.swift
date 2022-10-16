//
//  MarketViewModel.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Foundation
import Combine

protocol MarketViewModelProtocol: ObservableObject {
    var currencies: [Currency] { get }
    func fetchCurrencies()
}

class MarketViewModel: MarketViewModelProtocol {
    
    private let repositoryProvider: RepositoryProvider<CurrenciesRepositoryProtocol>
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var currencies: [Currency] = []
    
    init(repositoryProvider: RepositoryProvider<CurrenciesRepositoryProtocol>) {
        self.repositoryProvider = repositoryProvider
    }
    
    func fetchCurrencies() {
        let repository = repositoryProvider.repository(for: .sandbox)
        repository.fetchCurrencies()
            .receive(on: DispatchQueue.main)
            .assign(to: \.currencies, on: self)
            .store(in: &subscriptions)
    }
}
