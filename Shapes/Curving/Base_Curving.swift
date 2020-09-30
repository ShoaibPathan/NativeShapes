//
//  Base_Curving.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 17.09.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct Base_Curving: Shape {
    var topOffset: CGFloat = 0
    var bottomOffset: CGFloat = 50
    
    var animatableData: CGFloat {
        get { return bottomOffset }
        set { bottomOffset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY + topOffset))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + topOffset),
                          control: CGPoint(x: rect.midX, y: rect.minY - topOffset))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomOffset))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY - bottomOffset),
                          control: CGPoint(x: rect.midX, y: rect.maxY + bottomOffset))

        path.closeSubpath()
        
        return path
    }
}


struct Base_Curving_Previews: PreviewProvider {
    static var previews: some View {
        Base_Curving()
         .frame(height: 200)
    }
}
