//
//  MainView.swift
//  CatFacts
//
//  Created by Neha Pant on 08/02/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel: CatViewModel
    
    var body: some View {
        List(mainViewModel.catsData) {cats in
            //Showing the cat Image
            ImageView(urlString: cats.url, width: 100, height: 100)
        }
    }
}

//#Preview {
    //MainView(mainViewModel: MainViewModel(networkManager: Netw))
//}
