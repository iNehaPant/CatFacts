//
//  ImageView.swift
//  CatFacts
//
//  Created by Neha Pant on 08/02/2025.
//

import SwiftUI

struct ImageView: View {
    private let urlString: String
    private let width: CGFloat
    private let height: CGFloat
    
    init(urlString: String, width: CGFloat, height: CGFloat) {
        self.urlString = urlString
        self.width = width
        self.height = height
    }
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
        } placeholder: {
            // Default Image
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ImageView(urlString: "https://google.com", width: 50, height: 50)
}
