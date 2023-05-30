//
//  TimeRecordModalView.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/28.
//  
//

import SwiftUI

struct TimeRecordModalView: View {
    @StateObject var stopwatchViewModel = StopwatchViewModel()
    @StateObject var timeRecordViewModel = TimeRecordViewModel()
    
    @State private var selectedTab = 0
    let learningTitle: String
    let learningIcon: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Picker("Tabs", selection: $selectedTab) {
                    Text("Stop Watch").tag(0)
                    Text("Manual").tag(1)
                        .onAppear() {
                            print("fnadkf", type(of: learningIcon))
                            print("fnaadkf", type(of: presentationMode))
                        }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                switch selectedTab {
                case 0:
                    VStack(spacing: 50) {
                        HeaderView(learningIcon: learningIcon, learningTitle: learningTitle)
                        StopwatchView()
                            .environmentObject(stopwatchViewModel)
                        RecordButton(selectedTab: $selectedTab, presentationMode: presentationMode)
                            .environmentObject(stopwatchViewModel)
                            .environmentObject(timeRecordViewModel)
                    }
                case 1:
                    VStack(spacing: 50) {
                        HeaderView(learningIcon: learningIcon, learningTitle: learningTitle)
                        TimeRecordView()
                            .environmentObject(timeRecordViewModel)
                        RecordButton(selectedTab: $selectedTab, presentationMode: presentationMode)
                            .environmentObject(stopwatchViewModel)
                            .environmentObject(timeRecordViewModel)
                    }
                default:
                    VStack(spacing: 50) {
                        HeaderView(learningIcon: learningIcon, learningTitle: learningTitle)
                        StopwatchView()
                        RecordButton(selectedTab: $selectedTab, presentationMode: presentationMode)
                            .environmentObject(stopwatchViewModel)
                            .environmentObject(timeRecordViewModel)
                    }
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}


struct HeaderView: View {
    let learningIcon: String
    let learningTitle: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(learningIcon)
                .renderingMode(.template)
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(learningTitle)
                .font(.title)
                .fontWeight(.semibold)
                .fixedSize(horizontal: true, vertical: false)
        }
        .padding(.top, 50)
        .frame(width: UIScreen.main.bounds.size.width*0.8, alignment: .leading)
    }
}

struct RecordButton: View {
    private enum AlertType {
        case close(String)
        case select(String)
    }
    
    @State private var selectedAlertType = AlertType.close("")
    @State private var showAlert = false
    @EnvironmentObject var stopwatchViewModel: StopwatchViewModel
    @EnvironmentObject var timeRecordViewModel: TimeRecordViewModel
    
    @Binding var selectedTab: Int
    @Binding var presentationMode: PresentationMode
    
    var body: some View {
        Button("Record my learning") {
            switch selectedTab {
            case 0:
                if stopwatchViewModel.isRunning {
                    stopwatchViewModel.stop()
                    // TODO: 表示されないのでなんとかする
                    showAlert = true
                    selectedAlertType = .close("The stop watch was still running. Please make sure if you can record it.")
                } else {
                    let timeString = stopwatchViewModel.timeDisplay
                    let components = timeString.split(separator: ":")
                    let minutes = Int(components[0]) ?? 0
                    let seconds = Double(components[1]) ?? 0.0
                    let hours = minutes / 60
                    let remainingMinutes = minutes % 60
                    let intSeconds = Int(seconds)
                    print("Elapsed time: \(hours) hours, \(remainingMinutes) minutes and \(intSeconds) seconds")
                    showAlert = true
                    selectedAlertType = .select("Is it ok to record your learning?")
                }
            case 1:
                // Retrieve the start time and end time here
                let startTime = timeRecordViewModel.startTime
                let endTime = timeRecordViewModel.endTime
                if endTime < startTime {
                    showAlert = true
                    selectedAlertType = .close("The end time is earlier than the start time. Please check the times.")
                } else {
                    let elapsedTime = endTime.timeIntervalSince(startTime)
                    let hours = Int(elapsedTime) / 3600
                    let minutes = Int(elapsedTime) / 60 % 60
                    let seconds = Int(elapsedTime) % 60
                    print("Elapsed time: \(hours) hours, \(minutes) minutes, \(seconds) seconds")
                    showAlert = true
                    selectedAlertType = .select("Is it ok to record your learning?")
                }
            default:
                break
            }
        }
        .alert(isPresented: $showAlert) {
            switch selectedAlertType {
            case .close(let message):
                return Alert(
                    title: Text("Alert"),
                    message: Text(message),
                    dismissButton: .default(Text("OK"))
                )
                
            case .select(let message):
                return  Alert(
                    title: Text("Alert"),
                    message: Text(message),
                    primaryButton: .default(Text("Yes"), action: {
                        $presentationMode.wrappedValue.dismiss()
                    }),
                    secondaryButton: .cancel(Text("No"))
                )
            }
        }
    }
}


struct TimeRecordModalView_Previews: PreviewProvider {
    static var previews: some View {
        TimeRecordModalView(learningTitle: "Listening", learningIcon: "listening")
    }
}
