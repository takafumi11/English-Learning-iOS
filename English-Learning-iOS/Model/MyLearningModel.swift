//
//  MyLearningModel.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/06/01.
//  
//

import Foundation

class ButtonData: Identifiable, ObservableObject {
    var id: Int
    var date: String
    var imageName: String
    var buttonText: String
    @Published var progress: Double
    var target: Double
    var current: Double
    var skillID: Int

    init(id: Int, date: String, imageName: String, buttonText: String, progress: Double, target: Double, current: Double, skillID: Int) {
        self.id = id
        self.date = date
        self.imageName = imageName
        self.buttonText = buttonText
        self.progress = progress
        self.target = target
        self.current = current
        self.skillID = skillID
    }
}
