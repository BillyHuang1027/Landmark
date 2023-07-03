//
//  CategoryItem.swift
//  SwiftUITest
//
//  Created by RD1-Billy on 2023/6/21.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(10)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.subheadline)
                .padding(.top, 15)
        }
        .padding([.top, .leading], 25)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
