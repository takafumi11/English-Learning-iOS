//
//  MyLearningViewModel.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/27.
//  
//

import SwiftUI

class MyLearningViewModel: ObservableObject {
    @Published var buttonDataArray: [ButtonData] = [
        ButtonData(id: 0, imageName: "listening", buttonText: "シャドーイング", progress: 0.7),
        ButtonData(id: 1, imageName: "listening", buttonText: "単語", progress: 0.3),
        ButtonData(id: 2, imageName: "listening", buttonText: "多読", progress: 1.0),
        ButtonData(id: 3, imageName: "listening", buttonText: "オンライン英会話", progress: 0.1),
        ButtonData(id: 4, imageName: "listening", buttonText: "瞬間英作文", progress: 0.5)
    ]
}
