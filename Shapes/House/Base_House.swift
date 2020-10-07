//
//  Base_House.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 17.09.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct Base_House: Shape {
     var offset: CGFloat = 0.75
        var corner: UIRectCorner = .bottomLeft
        
        var animatableData: CGFloat {
            get { return offset }
            set { offset = newValue}
        }
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            // Start point - Top Left
            path.move(to: CGPoint(x: 0, y: corner == .topLeft ? rect.maxY * offset : 0))
            // Top Right
            path.addLine(to: CGPoint(x: rect.maxX, y: corner == .topRight ? rect.maxY * offset : 0))
            // Bottom Right
            path.addLine(to: CGPoint(x: rect.maxX, y: corner == .bottomRight ? rect.maxY * offset : rect.maxY))
            
            path.addLine(to: CGPoint(x: 0, y: corner == .bottomLeft ? rect.maxY * offset : rect.maxY))
            path.closeSubpath()
            
            return path
        }
    }

struct Base_House_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Base_House()
                .previewLayout(.sizeThatFits)
                .frame(width: 300.0, height: 300.0)
            Base_House(offset: 0.5, corner: .topRight)
                .previewLayout(.sizeThatFits)
                .frame(width: 200.0, height: 300.0)
        }
    }
}
