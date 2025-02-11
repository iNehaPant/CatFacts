//
//  CatImage.swift
//  CatFacts
//
//  Created by Neha Pant on 09/02/2025.
//

import Foundation

struct CatImage: Decodable, Identifiable, Equatable {
    let id: String
    let url: String
    let breeds: [Breed]?

    static func == (lhs: Self, rhs: Self) -> Bool {
       return lhs.id == rhs.id &&
        lhs.url == rhs.url &&
        lhs.breeds == rhs.breeds
    }
}
