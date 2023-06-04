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
    
    @Published var selectedButtonData: ButtonData = BData.mock1
    
    enum BData {
        static let mock1 = ButtonData(id: 0, date: "2023-06-04", imageName: "listening", buttonText: "シャドーイング", progress: 0.2, target: 100, current: 20)
        static let mock2 = ButtonData(id: 5, date: "2023-06-04", imageName: "listening", buttonText: "シャfadsドーイング", progress: 0.7, target: 100, current: 70)
        static let mock3 = ButtonData(id: 6, date: "2023-06-04", imageName: "listening", buttonText: "単dfa語", progress: 0.3, target: 100, current: 30)
        static let mock4 = ButtonData(id: 7, date: "2023-06-04", imageName: "listening", buttonText: "多afd読", progress: 1.0, target: 100, current: 100)
        static let mock5 = ButtonData(id: 8, date: "2023-06-05", imageName: "listening", buttonText: "オンafライン英会話", progress: 0.1, target: 100, current: 10)
        static let mock6 = ButtonData(id: 9, date: "2023-06-05", imageName: "listening", buttonText: "瞬間英af作文", progress: 0.1, target: 100, current: 10)
    }
    
    let mockButtonData: [ButtonData] = [
        BData.mock1,
        BData.mock2,
        BData.mock3,
        BData.mock4,
        BData.mock5,
        BData.mock6
    ]
    
    @Published var buttonDataArray: [ButtonData] = []
    
    func updateButtonDate() {
        let learnedMin: Double = minute + second / 60
        let selectedDataID = selectedButtonData.id
        
        buttonDataArray.map {
            if $0.id == selectedDataID {
                $0.current += learnedMin
                $0.progress = $0.current / $0.target
            }
            return $0
        }
    }
    
    func fetchButtonData() {
        DispatchQueue.main.async {
            self.buttonDataArray = self.mockButtonData
        }
    }
}
