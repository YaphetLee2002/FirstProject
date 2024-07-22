//
//  ContentView.swift
//  FirstProject
//
//  Created by 李亚赟 on 2024/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SwiftUILearningToolbox()) {
                    Text("SwiftUI学习工具箱")
                }
                NavigationLink(destination: TextLengthView()) {
                    Text("文本长度计算器")
                }
                NavigationLink(destination: HelloWorldView()) {
                    Text("Hello World")
                }
                
            }
            .navigationTitle("主菜单")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
