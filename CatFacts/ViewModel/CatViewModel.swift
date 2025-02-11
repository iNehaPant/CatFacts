//
//  CatViewModel.swift
//  CatFacts
//
//  Created by Neha Pant on 09/02/2025.
//

import Foundation
import UIKit

@MainActor
class CatViewModel: ObservableObject {
    
    let networkManager: NetworkService
    @Published var catsData: [CatImage] = [CatImage]()
    @Published var catImage: CatImage?
    @Published var breedName: String?
    @Published var breedTemprament: String?
    @Published var breedImage: [String]?
    var catBreedId: String = ""
    @Published var imageLoading: Bool = false
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    let heightOfCatImage: CGFloat = 300.0
    let randomCatTxt = "Random Cat"
    let tapTxt = "Tap to see more breed details >>"
    let okTxt = "Ok"
    
    init(networkManager: NetworkService) {
        self.networkManager = networkManager
        Task {
            await self.fetchCatsData()
        }
    }
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    //fetch cat data
    func fetchCatsData() async {
        do {
            imageLoading = true
            let catsData: [CatImage] = try await self.networkManager.fetchCatsData(hasBreed: true)
            self.catImage = catsData.first
            if let catData = self.catImage,
               let breed = catData.breeds,
               let breedId = breed.first?.id {
                self.catBreedId = breedId
            }
            imageLoading = false
        } catch {
            imageLoading = false
            self.isError = true
            self.errorMessage = error.localizedDescription
        }
    }
    
    //Fetch Cat Breeds from breed Id
    func fetchBreedsById(from breedId: String, limit: Int) async {
        do  {
            imageLoading = true
            let catData: [CatImage] =  try await networkManager.fetchCatsData(limit: limit, breedId: breedId)
            self.breedImage = [String]()
            for cat in catData {
                breedImage?.append(cat.url)
                if let breed = cat.breeds {
                    breedName = breed.first?.name
                    breedTemprament = breed.first?.temperament
                }
            }
            imageLoading = false
        } catch {
            self.isError = true
            self.errorMessage = error.localizedDescription
        }
    }
}

