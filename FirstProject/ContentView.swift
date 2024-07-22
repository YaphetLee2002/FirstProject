//
//  ContentView.swift
//  FirstProject
//
//  Created by 李亚赟 on 2024/7/22.
//

import SwiftUI

struct CustomContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // 自定义背景
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.purple.opacity(0.3)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 30) {
                    Text("SwiftUI 学习之旅")
                        .font(.custom("Avenir-Heavy", size: 28))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            NavigationLink(destination: TextLengthView()) {
                                MenuItemView(title: "文本长度计算器", icon: "textformat.size")
                            }
                            
                            NavigationLink(destination: HelloWorldView()) {
                                MenuItemView(title: "Hello World", icon: "globe")
                            }
                            
                            NavigationLink(destination: SwiftUILearningToolbox()) {
                                MenuItemView(title: "SwiftUI 学习工具箱", icon: "figure.walk")
                            }
                            NavigationLink(destination: HTTPRequestView()) {
                                MenuItemView(title: "HTTP 请求", icon: "network")
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct MenuItemView: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
            
            Text(title)
                .font(.custom("Avenir-Medium", size: 18))
                .foregroundColor(.primary)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

struct CustomContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomContentView()
    }
}
