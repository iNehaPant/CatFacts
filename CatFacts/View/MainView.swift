//
//  MainView.swift
//  CatFacts
//
//  Created by Neha Pant on 08/02/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct MainView: View {
    @StateObject var viewModel: CatViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if let catImageData = viewModel.catImage {
                    NavigationLink(destination: BreedDetailView(viewModel: viewModel),
                                   label: {
                        VStack {
                            ImageView(width:  viewModel.screenWidth-20, height: viewModel.heightOfCatImage, url: catImageData.url, placeholderImage: "photo")
                                .cornerRadius(12)
                                .shadow(radius: 5)
                                .padding(.horizontal, 5)
                            
                            Text(viewModel.tapTxt)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.black.opacity(0.7))
                                .cornerRadius(8)
                        }
                    })
                    Spacer()
                    Spacer()
                    
                    Button {
                        Task {
                            await viewModel.fetchCatsData()
                        }
                    } label: {
                        Text(viewModel.randomCatTxt)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                            .padding(.horizontal, 40)
                    }
                    .disabled(viewModel.imageLoading ? true : false)
                    .opacity(viewModel.imageLoading ? 0.5 : 1.0)
                    .padding()
                    
                }
            }
            .alert(viewModel.errorMessage,
                   isPresented: $viewModel.isError,
                   actions: {
                Button(viewModel.okTxt, role: .cancel){}
            })
        }
    }
}

#Preview {
    MainView(viewModel: CatViewModel(networkManager: MockNetworkManager()))
}
