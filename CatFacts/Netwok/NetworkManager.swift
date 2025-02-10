//
//  NetworkManager.swift
//  CatFacts
//
//  Created by Neha Pant on 09/02/2025.
//

import Foundation

protocol NetworkService {
    func fetchCatsData<T: Decodable>(limit: Int?,
                                     hasBreed breed: Bool?,
                                     breedId: String?) async throws -> [T]
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
    
    func fetchCatsData<T: Decodable>(limit: Int? = nil,
                                     hasBreed breed: Bool? = nil,
                                     breedId: String? = nil) async throws -> [T] {
        let(data, _) = try await apiHandler.getData(from: url, session: session, limit: limit, hasBreed: breed, breedId: breedId)
        return try parserHandler.parseData(from: data)
    }
}

extension NetworkService {
    func fetchCatsData<T: Decodable>(limit: Int? = nil,
                                     hasBreed breed: Bool? = nil,
                                     breedId: String? = nil) async throws -> [T] {
        try await fetchCatsData(limit: limit, hasBreed: breed, breedId: breedId)
    }
}
