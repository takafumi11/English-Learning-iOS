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
        ButtonData(id: 0, date: "2023-05-31", imageName: "listening", buttonText: "シャドーイング", progress: 0.7),
        ButtonData(id: 1, date: "2023-05-31", imageName: "listening", buttonText: "単語", progress: 0.3),
        ButtonData(id: 2, date: "2023-05-31", imageName: "listening", buttonText: "多読", progress: 1.0),
        ButtonData(id: 3, date: "2023-05-31", imageName: "listening", buttonText: "オンライン英会話", progress: 0.1),
        ButtonData(id: 4, date: "2023-05-31", imageName: "listening", buttonText: "瞬間英作文", progress: 0.5),
        ButtonData(id: 5, date: "2023-06-02", imageName: "listening", buttonText: "シャfadsドーイング", progress: 0.7),
        ButtonData(id: 6, date: "2023-06-03", imageName: "listening", buttonText: "単dfa語", progress: 0.3),
        ButtonData(id: 7, date: "2023-06-04", imageName: "listening", buttonText: "多afd読", progress: 1.0),
        ButtonData(id: 8, date: "2023-06-01", imageName: "listening", buttonText: "オンafライン英会話", progress: 0.1),
        ButtonData(id: 9, date: "2023-06-01", imageName: "listening", buttonText: "瞬間英af作文", progress: 0.5)
    ]
}
