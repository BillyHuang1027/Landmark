//
//  CategoryHome.swift
//  SwiftUITest
//
//  Created by RD1-Billy on 2023/6/21.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationStack {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0)})
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .cornerRadius(10)
//                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Categoryrow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                .frame(height: 350)
            }
            .listStyle(.inset)
            .navigationTitle("Feature")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
