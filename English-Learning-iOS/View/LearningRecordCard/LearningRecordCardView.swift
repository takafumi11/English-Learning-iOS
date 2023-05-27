//
//  LearningRecordCardView.swift
//  English-Learning-iOS
//
//  Created by takafumi11 on 2023/05/27.
//  
//

import SwiftUI

struct LearningRecordCardView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .padding()
                }
            }
            Spacer()
            Text("This is a modal")
            Spacer()
        }
    }
}

struct LearningRecordCardView_Previews: PreviewProvider {
    static var previews: some View {
        LearningRecordCardView()
    }
}
