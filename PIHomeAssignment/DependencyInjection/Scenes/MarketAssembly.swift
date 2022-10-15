//
//  MarketAssembly.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 16.10.2022.
//

import Swinject

final class MarketAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MarketViewModel.self) { resolver in
            guard let repositoryProvider = resolver.resolve(RepositoryProvider<CurrenciesRepositoryProtocol>.self) else {
                fatalError("RepositoryProvider<CurrenciesRepositoryProtocol> dependency could not be resolved")
            }
            return MarketViewModel(repositoryProvider: repositoryProvider)
        }
    }
}
