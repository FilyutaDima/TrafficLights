//
//  ColorCircle.swift
//  TrafficLights
//
//  Created by Dmitry on 1.04.22.
//

import SwiftUI

struct ColorCircle: View {
    
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .overlay(Circle().stroke(Color.gray, lineWidth: 5))
            .shadow(color: .black, radius: 5)
            .frame(width: 100, height: 100)
            .opacity(opacity)
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(color: .red, opacity: 0.3)
    }
}

