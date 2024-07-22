//
//  HelloWorldView.swift
//  FirstProject
//
//  Created by 李亚赟 on 2024/7/22.
//

import SwiftUI

struct HelloWorldView: View {
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .navigationTitle("Hello World")
    }
}

struct HelloWorldView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HelloWorldView()
        }
    }
}
