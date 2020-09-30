//
//  Data.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 29.09.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct type: Identifiable {
    var id : Int
    var percent : CGFloat
    var time : String
    var rain : String
    
    
}

struct Bar: View {
    
    var percent : CGFloat = 0
    var time = ""
    var rain = ""
    
    var body: some View {
        VStack(){
            ZStack (alignment: .bottom) {

                Capsule()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.colorGrass, Color.colorMeadow]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 30, height: 100)
                    .shadow(radius: 1, x: 1,y: 1)
                Capsule()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.colorSecond, Color.colorThird]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 30, height: getHeight())
                    .shadow(radius: 1, x: 1,y: 1)
                Text(rain)
                    .font(.system(size: 10, weight: .light))
                    .padding(.bottom, 40.0)
                
            }
            Text(time)
                .font(.system(size: 12, weight: .light))
//                .padding(.bottom, 40.0)
        }
    }
    
    func getHeight()->CGFloat {
        return  percent
    }
}

struct upNext: Identifiable {
    var id : Int
    var temp : String
    var time : String
    var waetherType : String
    
    
}

struct NextHours: View{
    
    var temp = ""
    var time = ""
    var waetherType = ""
    
    var body: some View {
    ZStack{
        
        RoundedRectangle(cornerRadius: 40)
            .fill(LinearGradient(gradient: Gradient(colors: [Color.colorGrass, Color.colorMeadow]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .foregroundColor(.white)
            .frame(width: 70, height: 125)
            .shadow(radius: 1, x: 1,y: 1)
        VStack(spacing: 8){
            Text(time)
                .fontWeight(.regular)
                .frame(maxWidth: .infinity)
                .font(.system(size: 18, design: .rounded))
            Image(systemName: waetherType)
                .font(Font.system(size: 40))
            Text(temp)
                .fontWeight(.regular)
                .frame(maxWidth: .infinity)
                .font(.system(size: 18, design: .rounded))
                .frame(maxWidth: .infinity)

        }
    }
    .padding(2.0)
    
    
}
}
