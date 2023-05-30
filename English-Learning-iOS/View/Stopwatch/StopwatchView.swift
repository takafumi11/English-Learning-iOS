//
//  StopwatchView.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/27.
//  
//

import SwiftUI

struct StopwatchView: View {
    @EnvironmentObject var viewModel: StopwatchViewModel
    
    var body: some View {
        VStack {
            timeDisplayView(timeDisplay: $viewModel.timeDisplay)
            stopWatchButtonView
        }
    }
    
    var stopWatchButtonView: some View {
        HStack(spacing: 0) {
            Button(action: {
                viewModel.reset()
            }) {
                ZStack {
                    Circle()
                        .stroke(Color.gray, lineWidth: 2)
                        .frame(width: 80, height: 80)
                    
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 75, height: 75)
                    
                    Text("Reset")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                }
                
            }
            Spacer()
            Button(action: {
                if viewModel.isRunning {
                    viewModel.stop()
                } else {
                    viewModel.start()
                }
            }) {
                ZStack {
                    Circle()
                        .stroke(viewModel.isRunning ? Color.red : Color.green, lineWidth: 2)
                        .frame(width: 80, height: 80)
                    
                    Circle()
                        .foregroundColor(viewModel.isRunning ? Color.red : Color.green)
                        .frame(width: 75, height: 75)
                    
                    Text(viewModel.isRunning ? "Stop" : "Start")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                }
            }
        }
        .frame(width: UIScreen.main.bounds.size.width*0.8)
    }
}

struct timeDisplayView: View {
    @Binding var timeDisplay: String
    let diff: CGFloat = 200
    
    var body: some View {
        ZStack {
            let str1 = timeDisplay.prefix(3)
            let indexStart = timeDisplay.index(timeDisplay.startIndex, offsetBy: 3)
            let indexEnd = timeDisplay.index(timeDisplay.startIndex, offsetBy: 5)
            let str2 = timeDisplay[indexStart..<indexEnd]
            let indexStart2 = timeDisplay.index(timeDisplay.startIndex, offsetBy: 5)
            let indexEnd2 = timeDisplay.index(timeDisplay.startIndex, offsetBy: 6)
            let str3 = timeDisplay[indexStart2..<indexEnd2]
            let str4 = timeDisplay.suffix(2)
            
            Text(str1)
                .font(.system(size: 80, weight: .light, design: .default))
                .foregroundColor(.black)
                .padding(.trailing, diff)
            
            Text(str2)
                .font(.system(size: 80, weight: .light, design: .default))
                .foregroundColor(.black)
                .frame(width: diff)
            
            Text(str3)
                .font(.system(size: 80, weight: .light, design: .default))
                .foregroundColor(.black)
                .padding(.leading, diff / 2)
            
            Text(str4)
                .font(.system(size: 80, weight: .light, design: .default))
                .foregroundColor(.black)
                .padding(.leading, diff)
        }
    }
}

struct LearningRecordCardView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
