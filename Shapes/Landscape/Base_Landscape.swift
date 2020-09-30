//
//  Base_Landscape.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 08.09.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct Base_Landscape: Shape {
    var yOffset: CGFloat = 0.5
    
    var animatableData: CGFloat {
        get {
            return yOffset
        }
        set {
            yOffset = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        // Curve at the bottom
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                      control1: CGPoint(x: rect.maxX * 0.75, y: rect.maxY - (rect.maxY * yOffset)),
                      control2: CGPoint(x: rect.maxX * 0.25, y: rect.maxY + (rect.maxY * yOffset)))
        
        path.closeSubpath()
        
        return path
    }
}


struct Base_Landscape_Previews: PreviewProvider {
    static var previews: some View {
        Base_Landscape(yOffset: 0.7)
            .stroke(Color.red, lineWidth: 5)
            .frame(height: 500)
            
        .padding()
    }
}

