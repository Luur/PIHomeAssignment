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
        
        let headers = [
            "X-RapidAPI-Key": "f75b9db089msh34b47fe849f3c7dp10189ajsn64c2b151b1af",
            "X-RapidAPI-Host": "ms-finance.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: URL(string: "https://ms-finance.p.rapidapi.com/news/list?performanceId=0P0000OQN8")!)
        request.allHTTPHeaderFields = headers
        
        return URLSession.shared.dataTaskPublisher(for: request as URLRequest)
            .map { $0.data }
            .decode(type: [Article].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
