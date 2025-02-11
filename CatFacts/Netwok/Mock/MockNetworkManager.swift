//
//  MockNetworkManager.swift
//  CatFacts
//
//  Created by Neha Pant on 11/02/2025.
//

import Foundation

class MockNetworkManager: NetworkService {
    var mockCatImage: [CatImage]
    
    init(mockCatImage: [CatImage] =  [CatImage(
        id: "MTYzNTk2Mw",
        url: "https://cdn2.thecatapi.com/images/MTYzNTk2Mw.gif",
        breeds: [Breed(
            id: "tvan",
            name: "Turkish Van",
            temperament: "Agile, Intelligent, Loyal, Playful, Energetic"
        )]
    )])  {
        self.mockCatImage = mockCatImage
    }
    
    func fetchCatsData<T>(limit: Int?, hasBreed breed: Bool?, breedId: String?) async throws -> [T] where T : Decodable {
        return self.mockCatImage as! [T]
    }
}
