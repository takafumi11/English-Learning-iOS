//
//  TimeRecordViewModel.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/27.
//  
//

import Foundation

class TimeRecordViewModel: ObservableObject {
    @Published var startTime = Date()
    @Published var endTime = Date()
}
