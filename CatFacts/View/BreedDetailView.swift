//
//  BreedDetailView.swift
//  CatFacts
//
//  Created by Neha Pant on 09/02/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct BreedDetailView: View {
    @ObservedObject var viewModel: CatViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(viewModel.breedName ?? "")
                    .padding(.bottom, 20)
                    .font(Font.custom("Arial", size: 16).weight(.bold))
                
                VStack(alignment: .leading) {
                    if let breedTemprament = viewModel.breedTemprament, breedTemprament.count > 0 {
                        Text("Temperament:")
                            .font(Font.custom("Arial", size: 14).weight(.bold))
                        Text(viewModel.breedTemprament ?? "")
                            .font(Font.custom("Arial", size: 14))
                    }
                }
                
                if let breedImageData = viewModel.breedImage {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(breedImageData.indices, id:\.self) { index in
                                let breed = breedImageData[index]
                                
                                ImageView(width: 120, height: 120, url: breed, placeholderImage: "photo")
                               
                            }
                        }
                    }
                }
            }
            .padding()
            .alert(viewModel.errorMessage,
                   isPresented: $viewModel.isError,
                   actions: {
                Button(viewModel.okTxt, role: .cancel){}
            })
            .onAppear {
                Task {
                    await viewModel.fetchBreedsById(from: viewModel.catBreedId, limit: 4)
                }
            }
            .onDisappear {
                viewModel.breedImage = []
                viewModel.breedTemprament = ""
                viewModel.breedName = ""
            }
        }
    }
}

//#Preview {
//    BreedDetailView(viewModel: Cat)
//}
