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
        static let mock1 = ButtonData(id: 0, date: "2023-06-11", imageName: "listening", buttonText: "シャドーイング", progress: 0.2, target: 100, current: 20, skillID: 1)
        static let mock2 = ButtonData(id: 1, date: "2023-06-11", imageName: "reading", buttonText: "多読", progress: 0.7, target: 100, current: 70, skillID: 2)
        static let mock3 = ButtonData(id: 2, date: "2023-06-11", imageName: "reading", buttonText: "単語", progress: 0.3, target: 100, current: 30, skillID: 3)
        static let mock4 = ButtonData(id: 3, date: "2023-06-11", imageName: "speaking", buttonText: "オンライン英会話", progress: 0.1, target: 100, current: 10, skillID: 4)
        static let mock5 = ButtonData(id: 4, date: "2023-06-11", imageName: "speaking", buttonText: "瞬間英作文", progress: 0.1, target: 100, current: 10, skillID: 5)
        static let mock6 = ButtonData(id: 5, date: "2023-06-12", imageName: "listening", buttonText: "シャドーイング", progress: 0.2, target: 100, current: 20, skillID: 1)
        static let mock7 = ButtonData(id: 6, date: "2023-06-12", imageName: "reading", buttonText: "多読", progress: 0.7, target: 100, current: 70, skillID: 2)
        static let mock8 = ButtonData(id: 7, date: "2023-06-12", imageName: "reading", buttonText: "単語", progress: 0.3, target: 100, current: 30, skillID: 3)
        static let mock9 = ButtonData(id: 8, date: "2023-06-12", imageName: "speaking", buttonText: "オンライン英会話", progress: 0.1, target: 100, current: 10, skillID: 4)
        static let mock10 = ButtonData(id: 9, date: "2023-06-12", imageName: "speaking", buttonText: "瞬間英作文", progress: 0.1, target: 100, current: 10, skillID: 5)
        static let mock11 = ButtonData(id: 10, date: "2023-06-13", imageName: "listening", buttonText: "シャドーイング", progress: 0.2, target: 100, current: 20, skillID: 1)
        static let mock12 = ButtonData(id: 11, date: "2023-06-13", imageName: "reading", buttonText: "多読", progress: 0.7, target: 100, current: 70, skillID: 2)
        static let mock13 = ButtonData(id: 12, date: "2023-06-13", imageName: "reading", buttonText: "単語", progress: 0.3, target: 100, current: 30, skillID: 3)
        static let mock14 = ButtonData(id: 13, date: "2023-06-13", imageName: "speaking", buttonText: "オンライン英会話", progress: 0.1, target: 100, current: 10, skillID: 4)
        static let mock15 = ButtonData(id: 14, date: "2023-06-13", imageName: "speaking", buttonText: "瞬間英作文", progress: 0.1, target: 100, current: 10, skillID: 5)
        static let mock16 = ButtonData(id: 15, date: "2023-06-14", imageName: "listening", buttonText: "シャドーイング", progress: 0.2, target: 100, current: 20, skillID: 1)
        static let mock17 = ButtonData(id: 16, date: "2023-06-14", imageName: "reading", buttonText: "多読", progress: 0.7, target: 100, current: 70, skillID: 2)
        static let mock18 = ButtonData(id: 17, date: "2023-06-14", imageName: "reading", buttonText: "単語", progress: 0.3, target: 100, current: 30, skillID: 3)
        static let mock19 = ButtonData(id: 18, date: "2023-06-14", imageName: "speaking", buttonText: "オンライン英会話", progress: 0.1, target: 100, current: 10, skillID: 4)
        static let mock20 = ButtonData(id: 19, date: "2023-06-14", imageName: "speaking", buttonText: "瞬間英作文", progress: 0.1, target: 100, current: 10, skillID: 5)
    }
    
    let mockButtonData: [ButtonData] = [
        BData.mock1,
        BData.mock2,
        BData.mock3,
        BData.mock4,
        BData.mock5,
        BData.mock6,
        BData.mock7,
        BData.mock8,
        BData.mock9,
        BData.mock10,
        BData.mock11,
        BData.mock12,
        BData.mock13,
        BData.mock14,
        BData.mock15,
        BData.mock16,
        BData.mock17,
        BData.mock18,
        BData.mock19,
        BData.mock20
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
