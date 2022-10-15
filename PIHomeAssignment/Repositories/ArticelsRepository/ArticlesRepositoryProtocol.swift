//
//  ArticlesRepositoryProtocol.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Combine

protocol ArticlesRepositoryProtocol {
    func fetchArticles() -> AnyPublisher<[Article], Never>
}
