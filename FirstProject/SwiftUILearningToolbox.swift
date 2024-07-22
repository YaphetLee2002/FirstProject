//
//  SwiftUILearningToolbox.swift
//  FirstProject
//
//  Created by 李亚赟 on 2024/7/22.
//

import SwiftUI

struct SwiftUILearningToolbox: View {
    @State private var name = ""
    @State private var age = 0
    @State private var birthDate = Date()
    @State private var isHappy = false
    @State private var favoriteColor = Color.blue
    @State private var volume = 50.0
    @State private var selectedFruit: Fruit = .apple

    enum Fruit: String, CaseIterable, Identifiable {
        case apple = "苹果"
        case banana = "香蕉"
        case orange = "橘子"
        case strawberry = "草莓"
        
        var id: Self { self }
    }

    var body: some View {
        Form {
            Section(header: Text("文本输入")) {
                TextField("输入你的名字", text: $name)
                Stepper("年龄: \(age)", value: $age, in: 0...120)
                DatePicker("出生日期", selection: $birthDate, displayedComponents: .date)
            }
            
            Section(header: Text("开关和选择器")) {
                Toggle("今天心情好吗?", isOn: $isHappy)
                ColorPicker("选择喜欢的颜色", selection: $favoriteColor)
                Picker("选择喜欢的水果", selection: $selectedFruit) {
                    ForEach(Fruit.allCases) { fruit in
                        Text(fruit.rawValue).tag(fruit)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("滑块")) {
                Slider(value: $volume, in: 0...100, step: 1) {
                    Text("音量")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("100")
                }
                Text("当前音量: \(Int(volume))")
            }
            
            Section(header: Text("按钮和警告")) {
                Button("显示警告") {
                    // 在这里我们只是打印,因为SwiftUI的alert在iOS 15之前的版本中的使用方式不同
                    print("警告被触发")
                }
            }
            
            Section(header: Text("结果展示")) {
                Text("你好, \(name)!")
                Text("你的年龄是 \(age) 岁")
                Text("你出生于 \(formattedDate)")
                Text("你今天\(isHappy ? "很开心" : "不太开心")")
                Text("你最喜欢的水果是 \(selectedFruit.rawValue)")
                Text("你选择的颜色").foregroundColor(favoriteColor)
            }
        }
        .navigationTitle("SwiftUI学习工具箱")
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter.string(from: birthDate)
    }
}

struct SwiftUILearningToolbox_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SwiftUILearningToolbox()
        }
    }
}
