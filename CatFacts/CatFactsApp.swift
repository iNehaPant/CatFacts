//
//  CatFactsApp.swift
//  CatFacts
//
//  Created by Neha Pant on 08/02/2025.
//

import SwiftUI

@main
struct CatFactsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: CatViewModel(
                networkManager: NetworkManager(url: Configuration.baseUrl,
                                               parserHandlder: ParserHandler(),
                                               apiHandler: APIHandler(),
                                               session: URLSession.shared)))
        }
    }
}
