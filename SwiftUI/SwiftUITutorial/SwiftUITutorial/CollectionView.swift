//
//  CollectionView.swift
//  SwiftUITutorial
//
//  Created by Misha Abaiev on 31.12.2024.
//

import SwiftUI

struct CollectionView: View {
    let items = (1...25).map { "image \($0)" }
    let images = ["Image1",
                  "Image2",
                  "Image3",
                  "Image4",
                  "Image5"]
    
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(items, id: \.self) { index in
                        VStack {
                            Image(images[Int.random(in: 0..<5)])
                                .resizable()
                                .scaledToFit()
                                .frame(height: 130)
                            Text(index)
                                .font(.headline)
                                .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray5))
                    }
                }
            }
        }
    }
}

#Preview {
    CollectionView()
}
