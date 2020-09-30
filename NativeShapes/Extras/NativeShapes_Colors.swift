//
//  NativeShapes_Colors.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 16.09.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct StandardColor {
    
    @Environment(\.presentationMode) var presentationMode
    
    var id = UUID()
    var name: String
    var color: Color
}
struct NativeShapes_Colors: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var colors = [
        StandardColor(name: "Color Accent", color: Color.colorAccent),
        StandardColor(name: "Color Background", color: Color.colorBackground),
        StandardColor(name: "Color Foreground", color: Color.colorForeground),
        StandardColor(name: "colorSecond", color: Color.colorSecond),
        StandardColor(name: "colorThird", color: Color.colorThird),
        StandardColor(name: "colorMainText", color: Color.colorMainText),
        StandardColor(name: "colorSnow", color: Color.colorSnow),
        StandardColor(name: "colorMountainTop", color: Color.colorMountainTop),
        StandardColor(name: "colorMountainMid", color: Color.colorMountainMid),
        StandardColor(name: "colorSkyDay", color: Color.colorSkyDay),
        StandardColor(name: "colorSkyNight", color: Color.colorSkyNight),
        StandardColor(name: "colorGrass", color: Color.colorGrass),
        StandardColor(name: "colorMeadow", color: Color.colorMeadow),
    ]
    
    var body: some View {
        
        VStack(){
            ZStack {
                
                Base_Mountain(xOffset: 0.5)
                    .fill(Color.colorAccent)
                    .frame(height: 100.0)
                    .shadow(radius: 5, y: 5)
                    .scaleEffect(x: -1, y: -1)
                Base_Mountain(xOffset: 1)
                    .fill(Color.colorSecond)
                    .frame(height: 140.0)
                    .shadow(radius: 4)
                    .scaleEffect(x: -1, y: -1)
                Base_Mountain()
                    .fill(Color.colorThird)
                    .frame(height: 140.0)
                    .shadow(radius: 4)
                    .scaleEffect(x: -1, y: -1)
                Base_Mountain(xOffset: -0.75)
                    .fill(Color.colorSecond)
                    .frame(width: 250, height: 140.0)
                    .scaleEffect(x: -1, y: -1)
                    .overlay(Text("Colors Used")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.colorMainText)
                                .multilineTextAlignment(.center))
            }
            
            List {
                ForEach(colors, id: \.id) { color in
                    Swatch(color: color)
                }
                
            }
            
            // TODO: Update list
            //        .listStyle(SidebarListStyle())
            
            
            .navigationBarBackButtonHidden(true)
            // Add your custom back button here
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }) {
                                        ZStack {
                                            Base_Mountain(xOffset: 0.5)
                                                .fill(Color.colorThird)
                                                .previewLayout(.sizeThatFits)
                                                .frame(width: 24.0, height: 24.0)
                                                .scaleEffect(x: 1, y: -1)
                                                .shadow(radius: 2, y: 2)
                                                .rotationEffect(.degrees(90))
                                            Base_Mountain(xOffset: 0.5)
                                                .fill(Color.colorAccent)
                                                .previewLayout(.sizeThatFits)
                                                .frame(width: 18.0, height: 20.0)
                                                .scaleEffect(x: 1, y: -1)
                                                .shadow(radius: 1, y: 1)
                                                .padding(.bottom, 10.0)
                                                .rotationEffect(.degrees(90))
                                            Base_Mountain(xOffset: 0.5)
                                                .fill(Color.colorThird)
                                                .previewLayout(.sizeThatFits)
                                                .frame(width: 12.0, height: 16.0)
                                                .scaleEffect(x: 1, y: -1)
                                                .padding(.bottom, 20.0)
                                                .rotationEffect(.degrees(90))
                                        }
                                        
                                    })
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct Swatch: View {
    var color: StandardColor
    var body: some View {
        HStack(spacing: 15) {
            
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(color.color)
                .frame(width: 24, height: 24)
                .frame(width: 50)
            Text(color.name)
            Spacer()
        }
    }
    
}


struct NativeShapes_Colors_Previews: PreviewProvider {
    static var previews: some View {
        NativeShapes_Colors()
        //         .previewLayout(.sizeThatFits)
    }
}
