//
//  CurrenciesRepositoryProtocol.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Combine

protocol CurrenciesRepositoryProtocol {
    func fetchCurrencies() -> AnyPublisher<[Currency], Never>
}
