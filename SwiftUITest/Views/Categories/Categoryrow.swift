//
//  Categoryrow.swift
//  SwiftUITest
//
//  Created by RD1-Billy on 2023/6/21.
//

import SwiftUI

struct Categoryrow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text(categoryName)
                .font(.title2)
                .bold()
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .center, spacing: 1) {
                    ForEach(items) { landmark in
                        GeometryReader { geometry in
                            NavigationLink(value: landmark) {
                                CategoryItem(landmark: landmark)
                                    .shadow(color: .black, radius: 10, x: 0, y: 10)
                            }
                            .navigationDestination(for: Landmark.self) { landmark in
                                LandmarkDetail(landmark: landmark)
                            }
                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX) / -20), axis: (x: 0, y: 10.0, z: 0))
                        }
                        .frame(width: 250, height: 300)
                    }
                }
                .fixedSize()
            }
        }
        .padding(20)
    }
}

struct Categoryrow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Categoryrow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
