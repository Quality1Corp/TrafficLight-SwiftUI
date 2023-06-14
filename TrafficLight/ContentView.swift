//
//  ContentView.swift
//  TrafficLight
//
//  Created by MikhaiL on 14.06.2023.
//

import SwiftUI

enum CurrentLight {
    case off, red, yellow, green
}

struct ContentView: View {
    @State private var buttonTitle = "START"
    @State private var currentLight: CurrentLight = .off
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                ColorCircleView(
                    color: .red,
                    opacity: currentLight == .red ? 1 : 0.3
                )
                ColorCircleView(
                    color: .yellow,
                    opacity: currentLight == .yellow ? 1 : 0.3
                )
                ColorCircleView(
                    color: .green,
                    opacity: currentLight == .green ? 1 : 0.3
                )
                
                Spacer()
                
                Button(action: nextColor) {
                    Text(buttonTitle)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .frame(width: 200, height: 60)
                .background(.blue)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 4)
                )
            }
            .padding()
        }
    }
    
    private func nextColor() {
        switch currentLight {
            case .off: currentLight = .red
            case .red: currentLight = .yellow
            case .yellow: currentLight = .green
            case .green: currentLight = .red
        }
        if buttonTitle == "START" {
            buttonTitle = "NEXT"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
