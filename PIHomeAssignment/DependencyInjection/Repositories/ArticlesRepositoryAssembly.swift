//
//  ArticlesRepositoryAssembly.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Foundation
import Swinject

final class ArticlesRepositoryAssembly: Assembly {

    func assemble(container: Container) {
        
        container.register(ArticlesRepositoryProtocol.self, name: "web") { resolver in
            return ArticlesWebRepository()
        }
        .inObjectScope(.container)
        
        container.register(ArticlesRepositoryProtocol.self, name: "memory") { _ in
            return ArticlesMemoryRepository()
        }
        .inObjectScope(.container)
        
        container.register(RepositoryProvider<ArticlesRepositoryProtocol>.self) { resolver in
            guard let memoryRepository = resolver.resolve(ArticlesRepositoryProtocol.self, name: "memory") else {
                fatalError("ArticlesRepositoryProtocol dependency could not be resolved")
            }
            guard let webRepository = resolver.resolve(ArticlesRepositoryProtocol.self, name: "web") else {
                fatalError("ArticlesRepositoryProtocol dependency could not be resolved")
            }
            return RepositoryProvider<ArticlesRepositoryProtocol>(memoryRepository: memoryRepository, webRepository: webRepository)
        }
        .inObjectScope(.container)
    }
}
