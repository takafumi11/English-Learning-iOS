//
//  MyLearningViewModel.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/27.
//  
//

import SwiftUI

class MyLearningViewModel: ObservableObject {
    var minute: Double = 0
    var second: Double = 0
    
    @Published var buttonDataArray: [ButtonData] = [
        ButtonData(id: 0, date: "2023-06-01", imageName: "listening", buttonText: "シャドーイング", progress: 0.2, target: 100, current: 20),
        ButtonData(id: 1, date: "2023-06-01", imageName: "listening", buttonText: "単語", progress: 0.3, target: 100, current: 30),
        ButtonData(id: 2, date: "2023-06-01", imageName: "listening", buttonText: "多読", progress: 1.0, target: 100, current: 10),
        ButtonData(id: 3, date: "2023-06-01", imageName: "listening", buttonText: "オンライン英会話", progress: 0.1, target: 100, current: 20),
        ButtonData(id: 4, date: "2023-06-01", imageName: "listening", buttonText: "瞬間英作文", progress: 0.5, target: 100, current: 5),
        ButtonData(id: 5, date: "2023-06-02", imageName: "listening", buttonText: "シャfadsドーイング", progress: 0.7, target: 100, current: 90),
        ButtonData(id: 6, date: "2023-06-03", imageName: "listening", buttonText: "単dfa語", progress: 0.3, target: 100, current: 100),
        ButtonData(id: 7, date: "2023-06-04", imageName: "listening", buttonText: "多afd読", progress: 1.0, target: 100, current: 40),
        ButtonData(id: 8, date: "2023-06-01", imageName: "listening", buttonText: "オンafライン英会話", progress: 0.1, target: 100, current: 60),
        ButtonData(id: 9, date: "2023-06-01", imageName: "listening", buttonText: "瞬間英af作文", progress: 0.5, target: 100, current: 20)
    ]
    
    func updateButtonDate(id: Int) {
        let learnedMin: Double = minute + second / 60
        if let index = buttonDataArray.firstIndex(where: { $0.id == id }) {
            buttonDataArray[index].current += learnedMin
            buttonDataArray[index].progress = buttonDataArray[index].current / buttonDataArray[index].target
        }
        
        print("fnakfn", buttonDataArray)
    }
    
}
