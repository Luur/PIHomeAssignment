//
//  CurrenciesMemoryRepository.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Foundation
import Combine

class CurrenciesMemoryRepository: CurrenciesRepositoryProtocol {
    
    func fetchCurrencies() -> AnyPublisher<[Currency], Never> {
        Future<[Currency], Never> { promise in
            DispatchQueue.main.asyncAfter(deadline:.now() + 1.5) {
                promise(.success(Currency.all))
            }
        }
        .eraseToAnyPublisher()
    }
}
