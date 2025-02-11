//
//  ImageView.swift
//  CatFacts
//
//  Created by Neha Pant on 11/02/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageView: View {
    
    private let width: CGFloat
    private let height: CGFloat
    private let url: String
    private let placeholderImage: String
    
    init(width: CGFloat,
         height: CGFloat,
         url: String,
         placeholderImage: String) {
        self.width = width
        self.height = height
        self.url = url
        self.placeholderImage = placeholderImage
    }
    
    var body: some View {
        WebImage(url: URL(string: url), options: [.scaleDownLargeImages]) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
        } placeholder: {
            Image(systemName: placeholderImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .foregroundColor(.gray)
                .opacity(0.5)
        }
    }
}

#Preview {
    ImageView(width: 120, height: 120, url: "https://google.com", placeholderImage: "photo")
}
