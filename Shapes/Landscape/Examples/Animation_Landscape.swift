//
//  Animation_Landscape.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 06.10.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct Animation_Landscape: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var sky = true
    @State private var fog1 = true
    @State private var fog2 = true
    @State private var temp = false
    @State private var response = 1.55
    @State private var weatherTypeText = false
    @State private var locationText = false
    
    var body: some View {
        VStack(alignment: .leading){
            
            Spacer().frame(maxWidth: .infinity)
            
            ZStack(){
                
                MoonView()
                
                ZStack(alignment: .bottom){

                    Base_Landscape(yOffset: -1.5)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.colorMeadow, Color.colorGrass]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .previewLayout(.sizeThatFits)
                        .frame(width: 430.0, height: 100.0)
                        .scaleEffect(x: 1, y: -1)
                    
                    
                    LHBottom()
                    LHTop()
                    
                    Base_Landscape(yOffset: -0.5)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.colorGrass, Color.colorMeadow]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: 200.0)
                        .offset(x: 0, y: -130)
                        .shadow(radius: 6)
                        .scaleEffect(x: 1, y: -1)

                    Base_Landscape(yOffset: fog1 ? -0.6 : 0.6)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.colorMountainTop, Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .opacity(0.8)
                        .animation(Animation.easeInOut(duration: 5.5).repeatForever(autoreverses: true))
                        .frame(width: 630.0, height: 300.0)
                        .scaleEffect(x: 1, y: -1)
                        .onAppear { self.fog1.toggle() }
                    
                    Waves()
                    
                    Base_Landscape(yOffset: fog2 ? 0.2 : -0.2)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.colorMountainTop, Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .opacity(0.4)
                        .animation(Animation.easeInOut(duration: 4.5).repeatForever(autoreverses: true))
                        .frame(width: 630.0, height: 330.0)
                        .scaleEffect(x: 1, y: -1)
                        .onAppear { self.fog2.toggle() }
                    
                    
                    Text("Canon Beach")
                        .font(.system(size: 35, weight: .heavy, design: .rounded))
                        .opacity(locationText ? 0.7 : 0.1)
                        .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                        .multilineTextAlignment(.trailing)
                        .offset(x: -40, y: -240)
                        .onAppear { locationText.toggle() }


                    Text("Fog")
                        .font(.system(size: 25, weight: .light, design: .rounded))
                        .opacity(weatherTypeText ? 0.7 : 0.1)
                        .animation(Animation.easeInOut(duration: 2.5).repeatForever(autoreverses: true))
                        .multilineTextAlignment(.trailing)
                        .offset(x: -130,y: -210)
                        .onAppear { weatherTypeText.toggle() }
                    
                    Text("37°")
                        .font(.system(size: 160, weight: .heavy, design: .rounded))
                        .opacity(0.8)
                        .multilineTextAlignment(.center)
                        .offset(x: 0, y: temp ? -40 : 240)
                        .animation(Animation.spring(response: response, dampingFraction: 0.5).delay(3))
                        .onAppear { temp.toggle() }
                    
                    
                }
                
            }
        }.frame(maxHeight: .infinity)
        
        .background(Color.colorSkyNight)
        .animation(.easeInOut(duration: 6))
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
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
    }
}

struct Animation_Landscape_Previews: PreviewProvider {
    static var previews: some View {
        Animation_Landscape()
    }
}

struct LHTop: View {
    
    @State private var light = false
    
    let gradient = Gradient(colors: [.white, .yellow, Color.colorSkyNight])
    
    var body: some View {
        Rectangle()
            .fill(Color.red)
            .frame(width: 80, height: 150)
            .offset(x: 90, y: -310)
        
        Rectangle()
            .fill(Color.white)
            .frame(width: 90, height: 30)
            .offset(x: 90, y: -310)
        
        Rectangle()
            .fill(Color.white)
            .frame(width: 90, height: 30)
            .offset(x: 90, y: -410)
        
        Rectangle()
            .fill(Color.white)
            .frame(width: 90, height: 20)
            .offset(x: 90, y: -460)
        
        ZStack(){
            Rectangle()
                .fill(Color.blue)
                .frame(width: 80, height: 60)
                .offset(x: 90, y: -480)
                .opacity(0.2)
            
            Base_Curving(topOffset: 10, bottomOffset: 0)
                .fill(Color.yellow)
                .frame(width: 30, height: 10)
                .offset(x: 90, y: -485)
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 30, height: 20)
                .offset(x: 90, y: -470)
            
            LighthouseLight()
                .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 1, endRadius: 450))
                
                .frame(width: 600, height: 40)
                .rotationEffect(.degrees(light ? 360 : 0), anchor: .center)
                .rotation3DEffect(.degrees(80), axis: (x: 1, y: 0, z: 0))//1.8
                
                .animation(Animation.linear(duration: 5.75).repeatForever(autoreverses: false))
                .onAppear { self.light.toggle() }
                .offset(x: 90, y: -472)
            
            Base_Curving(topOffset: 5, bottomOffset: 0)
                .fill(Color.white)
                .frame(width: 10, height: 15)
                .offset(x: 90, y: -473)
            
        }
        
        Base_Curving(topOffset: 30, bottomOffset: 0)
            .fill(Color.red)
            .frame(width: 80, height: 50)
            .offset(x: 90, y: -530)
    }
}


struct Waves: View {
    
    @State private var wave1 = false
    @State private var wave2 = false
    @State private var wave3 = false
    
    var body: some View {
        Base_Landscape(yOffset: wave1 ? -1.5 : 1.5)
            .fill(Color.colorSkyDay)
            .previewLayout(.sizeThatFits)
            .frame(height: 70.0)
            .shadow(radius: 4)
            .animation(Animation.easeInOut(duration: 2.5).repeatForever(autoreverses: true))
            .scaleEffect(x: 1, y: -1)
            //                        .opacity(0.6)
            .onAppear { self.wave1.toggle() }
        Base_Landscape(yOffset: wave2 ? -1.2 : 1.2)
            .fill(Color.colorThird)
            .previewLayout(.sizeThatFits)
            .frame(height: 60.0)
            .shadow(radius: 4)
            .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(2))
            .scaleEffect(x: 1, y: -1)
            .opacity(0.8)
            .onAppear { self.wave2.toggle() }
        Base_Landscape(yOffset: wave3 ? 0.7 : -0.7)
            .fill(Color.colorSecond)
            .frame(height: 30.0)
            .shadow(radius: 4)
            .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
            .scaleEffect(x: 1, y: -1)
            .opacity(0.8)
            .onAppear { self.wave3.toggle() }
    }
}

struct MoonView: View {
    
    @State private var moon = true
    
    var body: some View {
        ZStack(alignment: .top){
            Circle()
                .fill(Color.white)
                .frame(width: 100, height: 100)
                .offset(x: -90, y: -490)
            
            
            ZStack(){
                Circle()
                    .fill(Color.gray)
                    .frame(width: 20, height: 20)
                    .offset(x: -90, y: -430)
                
                
                Circle()
                    .fill(Color.gray)
                    .frame(width: 40, height: 40)
                    .offset(x: -70, y: -460)
                
                Circle()
                    .fill(Color.gray)
                    .frame(width: 15, height: 15)
                    .offset(x: -110, y: -480)
                
                Circle()
                    .fill(Color.gray)
                    .frame(width: 25, height: 25)
                    .offset(x: -95, y: -490)
                
                Circle()
                    .fill(Color.gray)
                    .frame(width: 20, height: 20)
                    .offset(x: -125, y: -450)
                
            }
        }
    }
}

struct LHBottom: View {
    var body: some View {
        ZStack(){
            MySquare()
                .fill(Color.red)
                .frame(width: 150,height: 150)
                .offset(x: 90, y: -60)
            
            
            MySquare(leftOffset: 10, rightOffset: 10)
                .fill(Color.red)
                .frame(width: 100,height: 150)
                .offset(x: 90, y: -160)
            
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 120, height: 30)
                .offset(x: 90, y: -170)
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 150, height: 30)
                .offset(x: 90, y: -80)
        }
    }
}
