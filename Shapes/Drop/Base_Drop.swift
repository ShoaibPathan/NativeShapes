//
//  Base_Drop.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 17.09.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct Base_Drop: Shape {
    
    func path(in rect: CGRect) -> Path {
    
    Path { path in

        path.move(to: CGPoint(x: rect.size.width/2, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y: rect.size.height), control: CGPoint(x: rect.size.width, y: rect.size.height))
        path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y: 0), control: CGPoint(x: 0, y: rect.size.height))
        }
    }
}




struct Base_Drop_Previews: PreviewProvider {
    static var previews: some View {
        Base_Drop()
        .fill(LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .topLeading, endPoint: .bottom))
//        .stroke(lineWidth: 4)
        .frame(width: 200, height: 200)
    }
}
