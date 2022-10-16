//
//  EndpointProtocol.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 16.10.2022.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol EndpointProtocol {
    var url: URL { get }
    var requestMethod: RequestMethod { get }
    var headers: [String: String] { get }
    var parameters: [String: Any]? { get }
    func query(from parameters: [String: String?]) -> String
}

extension EndpointProtocol {
    
    func query(from parameters: [String: String?]) -> String {
        var components = URLComponents()
        let parameters = parameters.compactMapValues { $0 }
        components.queryItems = parameters.map { URLQueryItem(name: $0, value: $1) }
        guard let query = components.query, !query.isEmpty else { return "" }
        return "?" + query
    }
    
    var headers: [String: String] {
        return [:]
    }
    
    var parameters: [String: Any]? {
        return nil
    }
}
