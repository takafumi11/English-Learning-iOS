//
//  CalenderCardViewModel.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/26.
//  
//

import Foundation

class CalenderCardViewModel: ObservableObject {
    @Published var month: String = ""
    @Published var year: String = ""
    @Published var selectedDate: String = ""
    
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
    
    func getMonthAndYear(after days: Int) {
        let date = Calendar.current.date(byAdding: .day, value: days, to: Date())!
        
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        let month = monthFormatter.string(from: date)
        
        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "yyyy"
        let year = yearFormatter.string(from: date)
        
        self.month = month
        self.year = year
        
        self.selectedDate = getSelecteDate(date: date)
    }
    
    func getSelecteDate(date: Date) -> String {
        let tmpDate = date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: tmpDate)
        
        return dateString
    }
}
