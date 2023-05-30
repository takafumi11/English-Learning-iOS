//
//  ContentView.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/25.
//  
//

import SwiftUI

struct ContentView: View {
    @StateObject var calenderViewModel = CalenderCardViewModel()
    var body: some View {
        ScrollView {
            VStack {
                Color
                    .clear.frame(height: 50)
                
                CalenderCardView()
                    .environmentObject(calenderViewModel)
                    .padding(.horizontal, 16)
                
                Color
                    .clear.frame(height: 20)
                
                MyLearningView()
                    .environmentObject(calenderViewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
