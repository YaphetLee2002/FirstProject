//
//  HTTPRequestView.swift
//  FirstProject
//
//  Created by 李亚赟 on 2024/7/22.
//

import SwiftUI

struct HTTPRequestView: View {
    @State private var url = ""
    @State private var response = ""
    @State private var showingToast = false
    
    var body: some View {
        VStack {
            TextField("输入URL", text: $url)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("发送请求") {
                sendRequest()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            ScrollView {
                Text(response)
                    .padding()
            }
        }
        .navigationTitle("请求发送")
        .toast(isPresenting: $showingToast) {
            Toast(message: "请求发送成功")
        }
    }
    
    func sendRequest() {
        guard let url = URL(string: "https://raw.githubusercontent.com/YaphetLee2002/QuantumultRules/main/Icon.json") else {
            response = "无效的URL"
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.response = "错误: \(error.localizedDescription)"
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.response = "没有接收到数据"
                }
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.response = jsonString
                    self.showingToast = true
                }
            }
        }.resume()
    }
}

struct Toast: View {
    let message: String
    
    var body: some View {
        Text(message)
            .padding()
            .background(Color.black.opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct ToastModifier: ViewModifier {
    @Binding var isPresenting: Bool
    let duration: TimeInterval
    let toast: () -> Toast

    func body(content: Content) -> some View {
        content
            .overlay(
                ZStack {
                    if isPresenting {
                        toast()
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                                    withAnimation {
                                        isPresenting = false
                                    }
                                }
                            }
                    }
                }
            )
    }
}

extension View {
    func toast(isPresenting: Binding<Bool>, duration: TimeInterval = 2, toast: @escaping () -> Toast) -> some View {
        self.modifier(ToastModifier(isPresenting: isPresenting, duration: duration, toast: toast))
    }
}

struct HTTPRequestView_Previews: PreviewProvider {
    static var previews: some View {
        HTTPRequestView()
    }
}
