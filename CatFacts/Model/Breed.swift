//
//  Breed.swift
//  CatFacts
//
//  Created by Neha Pant on 09/02/2025.
//

import Foundation

struct Breed: Decodable, Equatable {
    let id: String
    let name: String
    let temperament: String
}
