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
                            
                            Text(viewModel.tapTxt)
                                .foregroundStyle(.black)
                                .background(.white)
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
                            .padding(10)
                            .background(.black)
                            .foregroundColor(.white)
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

//#Preview {
//MainView(mainViewModel: MainViewModel(networkManager: Netw))
//}
