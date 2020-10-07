//
//  Square.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 06.10.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct MySquare: Shape {
    
    var leftOffset: CGFloat = 25
    var rightOffset: CGFloat = 25
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.size.width - leftOffset, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.width))
        path.addLine(to: CGPoint(x: 0, y: rect.size.width))
        path.addLine(to: CGPoint(x: rightOffset, y: 0 ))
        path.closeSubpath()
        
        return path
    }
}


struct Square: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.size.width, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.width))
        path.addLine(to: CGPoint(x: 0, y: rect.size.width))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        
        return path
    }
    
}

struct Square_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MySquare()
                
                .frame(width: 100,height: 100)
                .previewLayout(.sizeThatFits)
            MySquare(leftOffset: 80, rightOffset: 80)
                .frame(width: 200, height: 200)
                .previewLayout(.sizeThatFits)
            MySquare(rightOffset: 100)
                .frame(height: 200)
                .previewLayout(.sizeThatFits)
            MySquare(leftOffset: 70, rightOffset: 300)
                .frame(height: 200)
                .previewLayout(.sizeThatFits)
        }
    }
}
