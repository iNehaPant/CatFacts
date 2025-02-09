//
//  NetworkManager.swift
//  CatFacts
//
//  Created by Neha Pant on 09/02/2025.
//

import Foundation

protocol NetworkService {
    func fetchCatsData<T: Decodable>(limit: Int?) async throws -> [T]
}

struct NetworkManager: NetworkService {
    private let url: String
    private let parserHandler: DataParser
    private let apiHandler: APIHandling
    private let session: URLSession
    
    init(url: String,
         parserHandlder: DataParser,
         apiHandler: APIHandling,
         session: URLSession) {
        self.url = url
        self.parserHandler = parserHandlder
        self.apiHandler = apiHandler
        self.session = session
    }
    
    func fetchCatsData<T: Decodable>(limit: Int? = nil) async throws -> [T] {
        let(data, _) = try await apiHandler.getData(from: url, session: session, limit: limit)
        return try parserHandler.parseData(from: data)
    }
}
