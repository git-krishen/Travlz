//
//  ContentView.swift
//  Travlz
//
//  Created by Krishen Sharma on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    @State private var isActive: Bool = false
    @State private var isVisible: Bool = false
    var appName = "Travlz"
    var body: some View {
        ZStack {
            if(isActive) {
                MainTabView()
            } else {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    Text(text)
                        .font(.custom("SnellRoundhand-Black", size: 80))
                        .foregroundStyle(.white)
                        .animation(.easeIn)
                        .onAppear {
                            text = ""
                            appName.enumerated().forEach { index, character in
                                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                                    text += String(character)
                                }
                            }
                        }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
