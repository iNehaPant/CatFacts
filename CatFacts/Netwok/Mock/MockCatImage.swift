//
//  MockCatImage.swift
//  CatFacts
//
//  Created by Neha Pant on 11/02/2025.
//

import Foundation

struct MockCatImage {
    static func getCatData() -> [CatImage] {
        let cat =  CatImage(
            id: "MTYzNTk2Mw",
            url: "https://cdn2.thecatapi.com/images/MTYzNTk2Mw.gif",
            breeds: [Breed(id: "tvan", name: "Turkish Van", temperament: "Agile, Intelligent, Loyal, Playful, Energetic")]
        )
        return [cat]
    }
}
