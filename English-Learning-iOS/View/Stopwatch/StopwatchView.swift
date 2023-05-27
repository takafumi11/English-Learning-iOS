//
//  StopwatchView.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/27.
//  
//

import SwiftUI

struct StopwatchView: View {
    @StateObject var viewModel = StopwatchViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                timeDisplayView(timeDisplay: $viewModel.timeDisplay)
                stopWatchButtonView
            }
        }
    }
    
    var stopWatchButtonView: some View {
        HStack {
            Button(action: {
                viewModel.reset()
            }) {
                Text("Reset")
                    .padding(20)  // Increase padding to make a bigger circle
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.white)
                    .font(.system(size: 10))
                    .clipShape(Circle())  // Clip the button to a circular shape
            }
            
            Button(action: {
                if viewModel.isRunning {
                    viewModel.stop()
                } else {
                    viewModel.start()
                }
            }) {
                Text(viewModel.isRunning ? "Stop" : "Start")
                    .padding(20)
                    .background(viewModel.isRunning ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .font(.system(size: 10))
                    .clipShape(Circle())
            }
        }
    }
}

struct timeDisplayView: View {
    @Binding var timeDisplay: String
    
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
            let diff: CGFloat = 160
            
            HStack {
                Text(str1)
                    .font(.system(size: 60, weight: .light, design: .default))
                    .foregroundColor(.white)
                    .padding(.trailing, diff - 5)
            }
            
            HStack {
                Text(str2)
                    .font(.system(size: 60, weight: .light, design: .default))
                    .foregroundColor(.white)
                    .frame(width: diff)
            }
            
            HStack {
                Text(str3)
                    .font(.system(size: 60, weight: .light, design: .default))
                    .foregroundColor(.white)
                    .padding(.leading, diff / 2)
            }
            
            HStack {
                Text(str4)
                    .font(.system(size: 60, weight: .light, design: .default))
                    .foregroundColor(.white)
                    .padding(.leading, diff)
            }
        }
    }
}

struct LearningRecordCardView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}

// TODO: It will be moved to another file later.
//        VStack {
//            HStack {
//                Spacer()
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }) {
//                    Image(systemName: "xmark")
//                        .foregroundColor(.black)
//                        .padding()
//                }
//            }
//            Spacer()
//            Text("This is a modal")
//            Spacer()
//        }
