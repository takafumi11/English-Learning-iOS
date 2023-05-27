//
//  CalenderCardViewModel.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/26.
//  
//

import Foundation

class CalenderCardViewModel {
    func getDayAndWeekday(after days: Int) -> (day: String, weekday: String) {
        let date = Calendar.current.date(byAdding: .day, value: days, to: Date())!
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "d"
        let day = dayFormatter.string(from: date)

        let weekdayFormatter = DateFormatter()
        weekdayFormatter.dateFormat = "EEEE"
        let weekday = weekdayFormatter.string(from: date)

        return (day, weekday)
    }
    
    func getMonthAndYear(after days: Int) -> (month: String, year: String) {
        let date = Calendar.current.date(byAdding: .day, value: days, to: Date())!
        
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        let month = monthFormatter.string(from: date)
        
        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "yyyy"
        let year = yearFormatter.string(from: date)
        
        return (month, year)
    }
}
