//
//  ContentView.swift
//  TrafficLights
//
//  Created by Dmitry on 1.04.22.
//

import SwiftUI

enum Colors{
    case red
    case redYellow
    case green
    case yellowAfterGreen
}

struct ContentView: View {
    
    @State private var position = -1
    @State private var opacityRed = 0.3
    @State private var opacityYellow = 0.3
    @State private var opacityGreen = 0.3
    
    @State private var nextColor: Colors = .red
    
    var body: some View {
        VStack {
            ColorCircle(color: .red, opacity: opacityRed)
            ColorCircle(color: .yellow,  opacity: opacityYellow).padding()
            ColorCircle(color: .green,  opacity: opacityGreen)
            
            Button {
            
                position += 1
                cleanTrafficLights()
                
                switch nextColor {
                case .red:
                    opacityRed = 1
                    nextColor = .redYellow
                case .redYellow:
                    opacityRed = 1
                    opacityYellow = 1
                    nextColor = .green
                case .green:
                    opacityGreen = 1
                    nextColor = .yellowAfterGreen
                case .yellowAfterGreen:
                    opacityYellow = 1
                    nextColor = .red
                }
                
            } label: {
                position == -1 ? Text("Start") : Text("Next")
            }
            .padding(100)
            
        }
    }
    
    private func cleanTrafficLights() {
        opacityRed = 0.3
        opacityYellow = 0.3
        opacityGreen = 0.3
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

