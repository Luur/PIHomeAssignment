//
//  CurrenciesWebRepository.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Foundation
import Combine

class CurrenciesWebRepository: CurrenciesRepositoryProtocol {
    
    func fetchCurrencies() -> AnyPublisher<[Currency], Never> {
        fatalError("Method not implemented")
    }
}

