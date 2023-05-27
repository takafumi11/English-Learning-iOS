//
//  StopwatchViewModel.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/27.
//  
//

import Foundation

class StopwatchViewModel: ObservableObject {
    @Published var timeDisplay = "00:00.00"
    @Published var isRunning = false
    
    var timer: Timer? = nil
    var startTime: Date? = nil
    var elapsedTimeWhenStopped = 0.0
    
    func start() {
        startTime = Date()
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            if let startTime = self.startTime {
                let elapsedTime = Date().timeIntervalSince(startTime) + self.elapsedTimeWhenStopped
                let minutes = Int(elapsedTime / 60)
                let seconds = Int(elapsedTime) % 60
                let milliseconds = Int((elapsedTime * 100)) % 100
                self.timeDisplay = String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
            }
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
        if let startTime = self.startTime {
            elapsedTimeWhenStopped += Date().timeIntervalSince(startTime)
        }
        isRunning = false
    }
    
    func reset() {
        stop()
        elapsedTimeWhenStopped = 0
        timeDisplay = "00:00.00"
    }
}
