//
//  ArticlesMemoryRepository.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Foundation
import Combine

class ArticlesMemoryRepository: ArticlesRepositoryProtocol {
    
    func fetchArticles() -> AnyPublisher<[Article], Never> {
        Future<[Article], Never> { promise in
            DispatchQueue.main.asyncAfter(deadline:.now() + 2) {
                promise(.success([]))
            }
        }
        .eraseToAnyPublisher()
    }
}
