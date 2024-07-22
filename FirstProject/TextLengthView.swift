//
//  TextLengthView.swift
//  FirstProject
//
//  Created by 李亚赟 on 2024/7/22.
//

import SwiftUI
import UIKit

struct TextLengthView: View {
    @State private var inputText = ""
    @State private var outputText = "0"
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("请输入文本", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                calculateLength()
                triggerHapticFeedback()
            }) {
                Text("提交")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text("文本长度: \(outputText)")
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .padding()
        .navigationTitle("文本长度计算器")
    }
    
    private func calculateLength() {
        outputText = "\(inputText.count)"
    }
    
    private func triggerHapticFeedback() {
        let impact = UIImpactFeedbackGenerator(style: .medium)
        impact.impactOccurred()
    }
}

struct TextLengthView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TextLengthView()
        }
    }
}
