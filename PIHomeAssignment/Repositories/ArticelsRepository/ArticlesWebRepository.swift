//
//  ArticlesWebRepository.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 15.10.2022.
//

import Foundation
import Combine

class ArticlesWebRepository: ArticlesRepositoryProtocol {
    
    func fetchArticles() -> AnyPublisher<[Article], Never> {
        let endpoint: ArticlesEndpoint = .list
        let request = NSMutableURLRequest(url: endpoint.url)
        request.httpMethod = endpoint.requestMethod.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        return URLSession.shared.dataTaskPublisher(for: request as URLRequest)
            .map { $0.data }
            .decode(type: [Article].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
