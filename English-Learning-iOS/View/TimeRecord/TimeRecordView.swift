//
//  TimeRecordView.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/27.
//  
//

import SwiftUI

struct TimeRecordView: View {
    @EnvironmentObject var timeRecordVM: TimeRecordViewModel
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(spacing: 30) {
                TimeSectionView(title: "Start", date: $timeRecordVM.startTime, screenWidth: screenWidth)
                TimeSectionView(title: "End", date: $timeRecordVM.endTime, screenWidth: screenWidth)
            }
        }
    }
}

struct TimeSectionView: View {
    var title: String
    @Binding var date: Date
    let screenWidth: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .frame(width: screenWidth * 0.6, alignment: .leading)
            
            TimeView(date: $date, screenWidth: screenWidth)
        }
    }
}

struct TimeView: View {
    @Binding var date: Date
    let screenWidth: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            DatePicker(selection: $date, displayedComponents: .date) {
                Text("Date:")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .frame(width: screenWidth * 0.6, alignment: .trailing)
            
            DatePicker(selection: $date, displayedComponents: .hourAndMinute) {
                Text("Time:")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .frame(width: screenWidth * 0.6, alignment: .trailing)
        }
    }
}

struct TimeRecordView_Previews: PreviewProvider {
    static var previews: some View {
        TimeRecordView()
    }
}
