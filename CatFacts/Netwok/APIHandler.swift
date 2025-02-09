//
//  APIHandler.swift
//  CatFacts
//
//  Created by Neha Pant on 09/02/2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
}

protocol APIHandling {
    func getData(from baseUrl: String, session: URLSession, limit: Int?) async throws -> (Data, URLResponse)
}

struct APIHandler: APIHandling {
    func getData(from baseUrl: String, session: URLSession, limit: Int?) async throws -> (Data, URLResponse) {
        var components = URLComponents(string: baseUrl)
        var queryItems = [URLQueryItem]()
        
        if let limit = limit {
            queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
        }
        components?.queryItems = queryItems
        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = HeadersHelper.getDefaultHeaders()
        
        return try await session.data(for: request)
        
    }
}
