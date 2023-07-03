//
//  Practice.swift
//  SwiftUITest
//
//  Created by RD1-Billy on 2023/6/28.
//

import SwiftUI

struct Practice: View {
    @State private var isToggleOn = false
    
    var body: some View {
        VStack {
            ChildView(isToggleOn: $isToggleOn)
            Text("Toggle is \(isToggleOn ? "On" : "Off")")
        }
    }
}

struct ChildView: View {
    @Binding var isToggleOn: Bool
    
    var body: some View {
        Toggle("Toggle", isOn: $isToggleOn)
    }
}

struct Practice_Previews: PreviewProvider {
    static var previews: some View {
        Practice()
    }
}
