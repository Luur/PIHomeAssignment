//
//  RepositoryProvider.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Foundation

enum Environment {
    case sandbox
    case development
}

protocol RepositoryProviderProtocol {
    associatedtype RepositoryProtocol
    func repository(for environment: Environment) -> RepositoryProtocol
}

class RepositoryProvider<RepositoryProtocol>: RepositoryProviderProtocol {
    
    private let memoryRepository: RepositoryProtocol
    private let webRepository: RepositoryProtocol
    
    init(memoryRepository: RepositoryProtocol, webRepository: RepositoryProtocol) {
        self.memoryRepository = memoryRepository
        self.webRepository = webRepository
    }
    
    func repository(for environment: Environment) -> RepositoryProtocol {
        switch environment {
        case .sandbox: return memoryRepository
        case .development: return webRepository
        }
    }
}
