//
//  MyLearningView.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/27.
//  
//

import SwiftUI
struct ButtonData: Identifiable {
    var id: Int
    var imageName: String
    var buttonText: String
    var progress: CGFloat
}


struct MyLearningView: View {
    @State private var showModal = false
    @StateObject private var viewModel = MyLearningViewModel()
    
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
            
            ForEach(viewModel.buttonDataArray) { buttonData in
                LearningButtonView(showModal: $showModal, buttonData: buttonData)
            }
        }
        
    }
}

struct LearningButtonView: View {
    @Binding var showModal: Bool
    @State private var progress: CGFloat = 0
    var buttonData: ButtonData
    
    var body: some View {
        Button(action: {
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
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                progress = buttonData.progress
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
            TimeRecordModalView(
            learningTitle: buttonData.buttonText,
            learningIcon: buttonData.imageName)
        }
    }
}

struct ProgressBarView: View {
    @Binding var progress: CGFloat
    
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
