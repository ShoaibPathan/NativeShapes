//
//  Base_Mountain.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 17.09.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct Base_Mountain: Shape {
    var xOffset: CGFloat = 0.0
    var animatableData: CGFloat
    {
        get { return xOffset }
        set { xOffset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX * xOffset, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
    
}


struct Base_Mountain_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Base_Mountain()
                .previewLayout(.sizeThatFits)
                .frame(width: 300.0, height: 300.0)
            Base_Mountain(xOffset: 0.5)
                .previewLayout(.sizeThatFits)
                .frame(width: 300.0, height: 300.0)
            Base_Mountain(xOffset: 1)
                .previewLayout(.sizeThatFits)
                .frame(width: 300.0, height: 300.0)
            Base_Mountain(xOffset: 1.5)
                .previewLayout(.sizeThatFits)
                .frame(width: 300.0, height: 300.0)
            Base_Mountain(xOffset: 0.5)
                .previewLayout(.sizeThatFits)
                .frame(width: 300.0, height: 300.0)
                .scaleEffect(x: 1, y: -1)
        }
        .foregroundColor(.blue)
    }
}

