//
//  CatViewModel.swift
//  CatFacts
//
//  Created by Neha Pant on 09/02/2025.
//

import Foundation

@MainActor
class CatViewModel: ObservableObject {
    
    let networkManager: NetworkService
    @Published var catsData: [CatImage] = [CatImage]()
    
    init(networkManager: NetworkService) {
        self.networkManager = networkManager
        Task {
            await self.fetchCatsData()
        }
    }
    
    //fetch cat data
    func fetchCatsData() async {
        do {
            let catsData: [CatImage] = try await self.networkManager.fetchCatsData(limit: 10)
            self.catsData = catsData
        } catch {
            //Handle error scenarios
        }
    }
}
