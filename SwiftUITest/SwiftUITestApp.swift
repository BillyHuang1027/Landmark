//
//  SwiftUITestApp.swift
//  SwiftUITest
//
//  Created by RD1-Billy on 2023/6/6.
//

import SwiftUI

@main
struct SwiftUITestApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
