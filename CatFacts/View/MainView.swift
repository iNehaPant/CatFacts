//
//  MainView.swift
//  CatFacts
//
//  Created by Neha Pant on 08/02/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct MainView: View {
    @StateObject var mainViewModel: CatViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if let catImageData = mainViewModel.catImage {
                    NavigationLink(destination: BreedDetailView(viewModel: mainViewModel),
                                   label: {
                        VStack {
                            WebImage(url: URL(string: catImageData.url)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: mainViewModel.screenWidth-20, height: 300)
                                
                            } placeholder: {
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: mainViewModel.screenWidth-20, height: 300)
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                            }
                            
                            Text("Tap to see more breed details >>")
                                .foregroundStyle(.black)
                                .background(.white)
                        }
                    })
                    Spacer()
                    Spacer()
                    
                    Button {
                        Task {
                            await mainViewModel.fetchCatsData()
                        }
                    } label: {
                        Text("Random Cat")
                            .padding(10)
                            .background(.black)
                            .foregroundColor(.white)
                    }
                    .disabled(mainViewModel.imageLoading ? true : false)
                    .opacity(mainViewModel.imageLoading ? 0.5 : 1.0)
                    .padding()
                    
                }
            }
            .alert(mainViewModel.errorMessage,
                   isPresented: $mainViewModel.isError,
                   actions: {
                Button("Ok", role: .cancel){}
            })
        }
    }
}

//#Preview {
//MainView(mainViewModel: MainViewModel(networkManager: Netw))
//}
