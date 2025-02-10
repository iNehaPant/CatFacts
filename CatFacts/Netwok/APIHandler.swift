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
    func getData(from baseUrl: String,
                 session: URLSession,
                 limit: Int?,
                 hasBreed: Bool?,
                 breedId: String?) async throws -> (Data, URLResponse)
}

struct APIHandler: APIHandling {
    func getData(from baseUrl: String,
                 session: URLSession,
                 limit: Int? = nil,
                 hasBreed: Bool? = nil,
                 breedId: String? = nil) async throws -> (Data, URLResponse) {
        var components = URLComponents(string: baseUrl)
        var queryItems = [URLQueryItem]()
        
        if let breedId = breedId {
            queryItems.append(URLQueryItem(name: "breed_ids", value: breedId))
        }
        
        if let limit = limit {
            queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
        }
        if let hasBreed = hasBreed {
            queryItems.append(URLQueryItem(name: "has_breeds", value: String(hasBreed)))
        }
       
        components?.queryItems = queryItems
        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }
        print(url)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = HeadersHelper.getDefaultHeaders()
        
        return try await session.data(for: request)
        
    }
}
