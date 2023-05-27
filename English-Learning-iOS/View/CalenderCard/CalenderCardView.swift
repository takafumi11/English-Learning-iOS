//
//  CalenderCardView.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/26.
//  
//

import SwiftUI

struct CalenderCardView: View {
    @StateObject var viewModel = CalenderCardViewModel()
    @State private var selectedButtonIndex: Int = 0
    
    // Define your button height here
    let buttonHeight: CGFloat = 100
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 5) {
                Text(viewModel.month)
                    .foregroundColor(Color(hex: "333333"))
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(viewModel.year)
                    .foregroundColor(Color(hex: "333333"))
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(0..<1000) { index in
                        let (day, weekday) = viewModel.getDayAndWeekday(after: index)
                        
                        ButtonView(dayText: day, weekdayText: weekday, isSelected: .constant(selectedButtonIndex == index))
                            .onTapGesture {
                                if selectedButtonIndex != index {
                                    selectedButtonIndex = index
                                    viewModel.getMonthAndYear(after: index)
                                }
                            }
                    }
                }
            }
            .frame(height: buttonHeight+2)
        }
        .onAppear() {
            viewModel.getMonthAndYear(after: 0)
        }
        
    }
}

struct ButtonView: View {
    let screenSize =  UIScreen.main.bounds.size
    var dayText: String
    var weekdayText: String
    @Binding var isSelected: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: screenSize.width / 5, height: 100).cornerRadius(10)
                .foregroundColor(isSelected ? Color.purple : Color.white)
                .overlay(RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color.gray.opacity(0.1), lineWidth: isSelected ? 0 : 0.3))
                .shadow(color: .gray, radius: isSelected ? 5 : 0, x: 0, y: 0)
            
            VStack(spacing: 10) {
                Text(weekdayText.prefix(3))
                    .font(.caption)
                Text(dayText)
                    .font(.headline)
            }
            .frame(width: screenSize.width / 5, height: 10)
            .foregroundColor(isSelected ? .white : .black)
        }
        
    }
}
struct CalenderCardView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderCardView()
    }
}
