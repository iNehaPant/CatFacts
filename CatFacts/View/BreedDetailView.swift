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
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(viewModel.breedName ?? "")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.primary)
                        .padding(.bottom, 8)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    VStack(alignment: .leading) {
                        if let breedTemprament = viewModel.breedTemprament, breedTemprament.count > 0 {
                            Text("Temperament:")
                                .font(Font.custom("Arial", size: 14).weight(.semibold))
                                .foregroundColor(.secondary)
                            
                            Text(viewModel.breedTemprament ?? "")
                                .font(.system(size: 16))
                                .foregroundColor(.primary)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }
                    
                    if let breedImageData = viewModel.breedImage {
                        Text("Gallery")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.secondary)
                            .padding(.top, 12)
                        
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(breedImageData.indices, id:\.self) { index in
                                    let breed = breedImageData[index]
                                    
                                    ImageView(width: 150, height: 150, url: breed, placeholderImage: "photo")
                                        .cornerRadius(12)
                                        .shadow(radius: 5)
                                        .onAppear {
                                            if index == breedImageData.count-1 {
                                                Task {
                                                    await viewModel.fetchBreedsById(from: viewModel.catBreedId, limit: viewModel.limit+5)
                                                }
                                            }
                                        }
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
                        await viewModel.fetchBreedsById(from: viewModel.catBreedId, limit: 5)
                    }
                }
                .onDisappear {
                    viewModel.breedImage = []
                    viewModel.breedTemprament = ""
                    viewModel.breedName = ""
                }
            }
        }
        if viewModel.imageLoading {
            ProgressView("Loading...")
                .padding()
        }
    }

}

#Preview {
    BreedDetailView(viewModel: CatViewModel(networkManager: MockNetworkManager()))
}
