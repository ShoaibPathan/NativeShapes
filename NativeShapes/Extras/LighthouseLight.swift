//
//  LighthouseLight.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 07.10.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct LighthouseLight: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        // path.addLine(to: CGPoint(x: rect.maxX, y: 0)) // Original straight top line
        
        // Top Curve
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY),
                          control: CGPoint(x: 250, y: 20))
        // Trailing Side
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        //        path.addLine(to: CGPoint(x: rightOffset, y: rect.maxY))
        
        // Bottom Curve
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                          control: CGPoint(x: 250, y: 20))
        // Leading Side
        path.closeSubpath()
        
        return path
    }
}
struct LighthouseLight_Previews: PreviewProvider {
    static var previews: some View {
        let gradient = Gradient(colors: [.white, .yellow, Color.colorSkyNight])
        Group {
            LighthouseLight()
                .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 1, endRadius: 350))
                .frame(width: 600, height: 40)
                .previewLayout(.sizeThatFits)
            
        }
        //            .preferredColorScheme(.dark)
    }
}
