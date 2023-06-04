//
//  MyLearningView.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/27.
//  
//

import SwiftUI

struct MyLearningView: View {
    @State private var showModal = false
    @StateObject private var viewModel = MyLearningViewModel()
    @EnvironmentObject var calenderViewModel: CalenderCardViewModel
    
    var body: some View {
        VStack {
            HStack(spacing: 5) {
                Text("My Learnings")
                    .foregroundColor(Color(hex: "333333"))
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            
            // 選択した日付のデータを取得。
            // TODO: progressをアップデートしてもここが反映されないので、確認するところから。
            let filteredData = viewModel.buttonDataArray.filter{ $0.date == calenderViewModel.selectedDate }
            
            ForEach(filteredData) { buttonData in
                LearningButtonView(showModal: $showModal, buttonData: buttonData)
                    .environmentObject(viewModel)
            }
        }
        .onAppear {
            viewModel.fetchButtonData()
        }
    }
}

struct LearningButtonView: View {
    @Binding var showModal: Bool
    @State private var progress: Double = 0
    @ObservedObject var buttonData: ButtonData
    @EnvironmentObject var viewModel: MyLearningViewModel
    
    
    var body: some View {
        Button(action: {
            viewModel.selectedButtonData = buttonData
            showModal = true
        }) {
            HStack(spacing: 10) {
                Image(buttonData.imageName)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, 20)
                
                VStack(alignment: .leading) {
                    Text(buttonData.buttonText)
                        .padding(.top, 10)
                        .fixedSize(horizontal: true, vertical: false)
                    
                    ProgressBarView(progress: $progress)
                        .onReceive(buttonData.$progress) { tmpProgress in
                            withAnimation(.easeInOut(duration: 1.0)) {
                                if tmpProgress > 1.0 {
                                    progress = 1.0
                                } else {
                                    progress = tmpProgress
                                }
                            }
                        }
                }
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 32)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
            .overlay(content: {
                HStack {
                    Spacer()
                    Image(systemName: "chevron.right")
                        .padding(.trailing, 20)
                }
            })
            .padding(.horizontal, 24)
        }
        .sheet(isPresented: $showModal) {
            TimeRecordModalView()
                .environmentObject(viewModel)
        }
    }
}

struct ProgressBarView: View {
    @Binding var progress: Double
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: UIScreen.main.bounds.width * 0.6, height: 10)
            
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: progress * (UIScreen.main.bounds.width * 0.6), height: 10)
        }
        .cornerRadius(15)
        .padding(.bottom, 10)
    }
}

struct MyLearningViee_Previews: PreviewProvider {
    static var previews: some View {
        MyLearningView()
    }
}
