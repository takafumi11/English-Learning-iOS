//
//  ContentView.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/25.
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Color
                .clear.frame(height: 50)
            CalenderCardView()
                .padding(.horizontal, 16)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
