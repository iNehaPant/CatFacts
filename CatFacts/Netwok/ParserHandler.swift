//
//  ParserHandler.swift
//  CatFacts
//
//  Created by Neha Pant on 09/02/2025.
//

import Foundation

protocol DataParser {
    func parseData<T: Decodable>(from data: Data) throws-> T
}

struct ParserHandler: DataParser {
    func parseData<T: Decodable>(from data: Data) throws-> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
