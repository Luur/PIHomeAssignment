//
//  CurrenciesRepositoryAssembly.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Foundation
import Swinject

final class CurrenciesRepositoryAssembly: Assembly {

    func assemble(container: Container) {
        
        container.register(CurrenciesRepositoryProtocol.self, name: "web") { resolver in
            return CurrenciesWebRepository()
        }
        .inObjectScope(.container)
        
        container.register(CurrenciesRepositoryProtocol.self, name: "memory") { _ in
            return CurrenciesMemoryRepository()
        }
        .inObjectScope(.container)
        
        container.register(RepositoryProvider<CurrenciesRepositoryProtocol>.self) { resolver in
            guard let memoryRepository = resolver.resolve(CurrenciesRepositoryProtocol.self, name: "memory") else {
                fatalError("CurrenciesRepositoryProtocol dependency could not be resolved")
            }
            guard let webRepository = resolver.resolve(CurrenciesRepositoryProtocol.self, name: "web") else {
                fatalError("CurrenciesRepositoryProtocol dependency could not be resolved")
            }
            return RepositoryProvider<CurrenciesRepositoryProtocol>(memoryRepository: memoryRepository, webRepository: webRepository)
        }
        .inObjectScope(.container)
    }
}
