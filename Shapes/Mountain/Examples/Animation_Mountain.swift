//
//  Animation_Mountain.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 17.09.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct Animation_Mountain: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var degrees: Double = 0
    @State private var change = false
    @State private var sun = false
    @State private var sky = true
    
    @State private var sunRay1 = false
    @State private var sunRay2 = false
    
    @State private var cloud1 = false
    @State private var cloud2 = false
    @State private var cloud3 = false
    @State private var cloud4 = false
    
    
    @State private var change1 = false
    @State private var change2 = false
    @State var spin = false
    @State var spin2 = false
    
    @State private var show = false
    
    
    
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Spacer().frame(maxWidth: .infinity)
            
            ZStack(){
                CloudsView()
                
                ZStack(alignment: .top){
                    Circle()
                        .fill(sun ? Color.yellow : Color.orange)
                        .frame(width: 100, height: 100)
                        .animation(.easeInOut(duration: 6))
                        .offset(x: sun ? 100: -100, y: sun ? -400: 200)
                        .onAppear { self.sun.toggle() }
                }
                
                CloudsView2()
                Backdrop()
                
                Text("Mt. Hood Meadows")
                    .font(.system(size: 35, weight: .heavy, design: .rounded))
                    .opacity(0.5)
                    .multilineTextAlignment(.trailing)
                    .offset(x: 10, y: -300)
                
                
                Text("Partly Cloudy")
                    .font(.system(size: 25, weight: .light, design: .rounded))
                    .opacity(0.5)
                    .multilineTextAlignment(.trailing)
                    .offset(x: 95,y: -260)
                
                InfoView()
                CloudsView3()
                CloudsView4()
            }
            
            
        }.frame(maxHeight: .infinity)
        
        .background(sky ? Color.colorSkyNight : Color.colorSkyDay)
        .animation(.easeInOut(duration: 6))
        .onAppear { self.sky.toggle() }
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

struct Animation_Mountain_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Animation_Mountain()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                .previewDisplayName("iPhone 11 Pro")
        }
    }
}

struct CloudsView: View {
    
    @State private var cloud1 = false
    @State private var cloud2 = false
    @State private var cloud3 = false
    
    
    var body: some View {
        ZStack(){
            Ellipse()
                .fill(Color.gray)
                .frame(width: 210, height: 70)
                .animation(.easeInOut(duration: 4))
                .offset(x: cloud1 ? -370 : 370, y: -210)
                .opacity(0.7)
                .onAppear { self.cloud1.toggle() }
            
            Ellipse()
                .fill(Color.gray)
                .frame(width: 330, height: 50)
                .animation(.easeInOut(duration: 4.6))
                .offset(x: cloud2 ? -370 : 370, y: -250)
                .onAppear { self.cloud2.toggle() }
            
            Ellipse()
                .fill(Color.white)
                .frame(width: 300, height: 60)
                .animation(.easeInOut(duration: 4.9))
                .offset(x: cloud3 ? -370 : 370, y: -160)
                .onAppear { self.cloud3.toggle() }
            
        }
    }
}

struct CloudsView2: View {
    
    @State private var cloud1 = false
    @State private var cloud2 = false
    @State private var cloud3 = false
    
    
    var body: some View {
        ZStack(){
            Ellipse()
                .fill(RadialGradient(gradient: Gradient(colors: [.colorMountainTop, .white]), center: .center, startRadius: 1, endRadius: 250))
                .frame(width: 330, height: 50)
                .animation(Animation.easeInOut(duration: 4.9))
                .offset(x: cloud1 ? 370 : -370, y: -110) //3
                .opacity(0.6)
                .onAppear { self.cloud1.toggle() }
            
            Ellipse()
                .fill(Color.white)
                .frame(width: 230, height: 130)
                //                .scaleEffect(self.spin2 ? 0.5: 1)
                .animation(.easeInOut(duration: 4.6))
                .offset(x: cloud2 ? 370 : -370, y: -100)
                .onAppear { self.cloud2.toggle() }
            
            Ellipse()
                .fill(Color.white)
                .frame(width: 300, height: 100)
                .animation(.easeInOut(duration: 4.9))
                .offset(x: cloud3 ? 370 : -370, y: -40)
                .onAppear { self.cloud3.toggle() }
            
            
        }
    }
}

struct CloudsView3: View {
    
    @State private var cloud1 = false
    @State private var cloud2 = false
    @State private var cloud3 = false
    
    
    var body: some View {
        ZStack(){
            Ellipse()
                .fill(RadialGradient(gradient: Gradient(colors: [Color.colorMountainTop, .gray]), center: .center, startRadius: 1, endRadius: 250))
                .frame(width: 430, height: 100)
                .animation(Animation.easeInOut(duration: 6.6).delay(3))
                .offset(x: cloud2 ? 450 : -450, y: -250) //4
                .onAppear { self.cloud2.toggle() }
            Ellipse()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.colorMountainTop]), startPoint: .top, endPoint: .bottom))
                .frame(width: 300, height: 100)
                .scaleEffect(self.cloud2 ? 1: 0)
                .animation(Animation.easeInOut(duration: 8.9).delay(3))
                .offset(x: cloud3 ? 370 : -670, y: -300) //3
                .onAppear { self.cloud3.toggle() }
                .opacity(0.9)
            Ellipse()
                .fill(RadialGradient(gradient: Gradient(colors: [.colorMountainTop, .white]), center: .center, startRadius: 1, endRadius: 250))
                .frame(width: 330, height: 50)
                .animation(Animation.easeInOut(duration: 8.9).delay(3))
                .offset(x: cloud1 ? 370 : -370, y: -200) //3
                .opacity(0.6)
                .onAppear { self.cloud1.toggle() }
            
        }
    }
}

struct CloudsView4: View {
    
    @State private var cloud1 = false
    @State private var cloud2 = false
    @State private var cloud3 = false
    
    
    var body: some View {
        ZStack(){
            Ellipse()
                .fill(RadialGradient(gradient: Gradient(colors: [Color.colorMountainTop, .gray]), center: .center, startRadius: 1, endRadius: 250))
                .frame(width: 430, height: 100)
                .animation(Animation.easeInOut(duration: 8.6).delay(2)
                            .repeatForever(autoreverses: false))
                .offset(x: cloud2 ? 450 : -450, y: -250) //4
                .onAppear { self.cloud2.toggle() }
            Ellipse()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.colorMountainTop]), startPoint: .top, endPoint: .bottom))
                .frame(width: 300, height: 100)
                .scaleEffect(self.cloud2 ? 1: 0)
                .animation(Animation.easeInOut(duration: 10.9).delay(2)
                            .repeatForever(autoreverses: false))
                .offset(x: cloud3 ? 370 : -670, y: -300) //3
                .onAppear { self.cloud3.toggle() }
                .opacity(0.9)
            Ellipse()
                .fill(RadialGradient(gradient: Gradient(colors: [.colorMountainTop, .white]), center: .center, startRadius: 1, endRadius: 250))
                .frame(width: 330, height: 50)
                .animation(Animation.easeInOut(duration: 10.9).delay(2)
                            .repeatForever(autoreverses: false))
                .offset(x: cloud1 ? 370 : -370, y: -200) //3
                .opacity(0.6)
                .onAppear { self.cloud1.toggle() }
            
        }
    }
}

struct Backdrop: View {
    
    @State private var moutain1 = true
    @State private var temp = false
    @State private var response = 1.55

    var body: some View {
        ZStack(alignment: .bottom){
            Base_Mountain(xOffset: 0.5)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.colorSnow, Color.colorMountainTop, Color.colorMountainMid]), startPoint: .top, endPoint: .bottom))
                .previewLayout(.sizeThatFits)
                .frame(width: 200.0, height: 600.0)
                .offset(x: -150, y: 0)
                .animation(.easeInOut(duration: 6))
            
            Base_Mountain(xOffset: 0.5)
                .fill(Color.colorSkyNight)
                .opacity(moutain1 ? 1 : 0)
                .previewLayout(.sizeThatFits)
                .frame(width: 200.0, height: 600.0)
                .offset(x: -150, y: 0)
                .animation(.easeInOut(duration: 5))
                .onAppear { moutain1.toggle() }
            
            
            Base_Mountain(xOffset: 0.4)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.colorSnow, Color.colorMountainTop, Color.colorMountainMid]), startPoint: .top, endPoint: .bottom))
                .previewLayout(.sizeThatFits)
                .frame(width: 200.0, height: 300.0)
            
            Base_Mountain(xOffset: 0.4)
                .fill(Color.colorSkyNight)
                .opacity(moutain1 ? 1 : 0)
                .previewLayout(.sizeThatFits)
                .frame(width: 200.0, height: 300.0)
                .offset(x: 0, y: 0)
            
            Text("43°")
                .font(.system(size: 160, weight: .heavy, design: .rounded))
                .opacity(0.5)
                .multilineTextAlignment(.center)
                .offset(x: 0, y: temp ? -340 : 140)
                .animation(Animation.spring(response: response, dampingFraction: 0.5).delay(3))
                .onAppear { temp.toggle() }
            
            ZStack(alignment: .bottom){
                Base_Landscape()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.colorGrass, Color.colorMeadow]), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .shadow(radius: 4)
                    .frame(height: 100.0)
                    .offset(x: 0, y: 0)
                    .scaleEffect(x: 1, y: -1)
                
                Base_Landscape()
                    .fill(Color.colorSkyNight)
                    .shadow(radius: 4)
                    .opacity(moutain1 ? 1 : 0)
                    .frame(height: 100.0)
                    .offset(x: 0, y: 0)
                    .scaleEffect(x: 1, y: -1)
            }
            
            ZStack(alignment: .bottom){
                
                Base_Mountain(xOffset: 0.5)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.colorMountainTop,  Color.colorMountainMid]), startPoint: .top, endPoint: .bottom))
                    .previewLayout(.sizeThatFits)
                    .frame(width: 100.0, height: 200.0)
                    .offset(x: 100, y: 0)
                
                Base_Mountain(xOffset: 0.5)
                    .fill(Color.colorSkyNight)
                    .opacity(moutain1 ? 1 : 0)
                    .previewLayout(.sizeThatFits)
                    .frame(width: 100.0, height: 200.0)
                    .offset(x: 100, y: 0)
                
                Base_Landscape(yOffset: -0.5)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.colorGrass, Color.colorMeadow]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(height: 50.0)
                    .offset(x: 0, y: 0)
                    .shadow(radius: 6)
                    .scaleEffect(x: 1, y: -1)
                
                Base_Landscape(yOffset: -0.5)
                    .fill(Color.colorSkyNight)
                    .opacity(moutain1 ? 1 : 0)
                    .frame(height: 50.0)
                    .offset(x: 0, y: 0)
                    .shadow(radius: 6)
                    .scaleEffect(x: 1, y: -1)
                
                Base_Mountain(xOffset: 0.5)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.colorMountainTop,  Color.colorMountainMid]), startPoint: .top, endPoint: .bottom))
                    .previewLayout(.sizeThatFits)
                    .frame(width: 150.0, height: 350.0)
                    .offset(x: -100, y: 0)
                
                Base_Mountain(xOffset: 0.5)
                    .fill(Color.colorSkyNight)
                    .opacity(moutain1 ? 1 : 0)
                    .previewLayout(.sizeThatFits)
                    .frame(width: 150.0, height: 350.0)
                    .offset(x: -100, y: 0)
            }
        }
    }
}

struct InfoView: View {
    
    @State private var slideUp = false
    @State private var info = false
    @State private var infoHide = false
    @State private var infoRotate = false
    
    var body: some View {
        ZStack{
            
            VStack(spacing: 10) {
                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 0.4)) {
                        self.slideUp.toggle()
                        self.info.toggle()
                        self.infoRotate.toggle()
                        
                    }
                }) {
                    Image(systemName: "chevron.up.circle")
                        .font(Font.system(size: 40))
                        .foregroundColor(.colorMountainMid)
                        .rotationEffect(.degrees(self.infoRotate ? 180 : 0))
                        .position(self.info ? CGPoint(x: 330, y: 85) : CGPoint(x: 330, y: 85))
                }
                
                Text("Next Hours")
                    .font(.system(size: 25, weight: .heavy, design: .rounded))
                    .offset(x: 90, y: -30)
                
                Group {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .bottom, spacing: 20) {
                                ForEach(weartherData){s in
                                    NextHours(temp: s.temp, time: s.time, waetherType: s.waetherType)
                                }
                            }
                            .padding([.leading, .bottom])
                            
                        }
                        .padding(.bottom, 5.0)
                        
                        VStack(spacing: 20) {
                            Text("Precipitation")
                                .font(.system(size: 15, weight: .heavy, design: .rounded))
                                .multilineTextAlignment(.leading)
                                .offset(x: 110, y: -10)
                        }
                        
                        HStack(alignment: .bottom, spacing: 20) {
                            ForEach(percents){i in
                                Bar(percent: i.percent,time: i.time, rain: i.rain)
                            }
                        }
                    }
                    
                }
                
                Spacer()
            }
            
            .padding(20.0)
            .frame(maxWidth: .infinity)
            .background(
                Base_Landscape(yOffset: -0.5)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.colorGrass, Color.colorMeadow]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(height: 500.0)
                    .offset(x: 0, y: -100)
                    .shadow(radius: 6)
                    .opacity(0.6)
                    .scaleEffect(x: 1, y: -1)
            )
            
// MARK: Swith to see info
//                  .offset(y: self.slideUp ? 0 : 0)
                    .offset(y: self.slideUp ? 0 : 470)
//
            .animation(Animation.easeInOut(duration: 1.5))
            
            Base_Landscape(yOffset: -0.5)
                .fill(Color.colorSkyNight)
                .frame(height: 500.0)
                .offset(x: 0, y: -100)
                .shadow(radius: 6)
                .opacity(infoHide ? 0 : 1)
                .scaleEffect(x: 1, y: -1)
                .offset(x: 0, y: 470)
                .animation(.easeInOut(duration: 5))
                .onAppear { infoHide.toggle() }
        }
    }
}


var percents = [
    type(id: 0, percent: 30, time: "7 AM", rain: "30 %"),
    type(id: 1, percent: 0, time: "8 AM", rain: "0 %"),
    type(id: 2, percent: 20, time: "9 AM", rain: "20 %"),
    type(id: 3, percent: 80, time: "10 AM", rain: "80 %"),
    type(id: 4, percent: 35, time: "11 AM", rain: "35 %"),
    type(id: 5, percent: 0, time: "12 PM", rain: "0 %")
]




var weartherData = [
    upNext(id: 0, temp: "40°", time: "7 AM", waetherType: "cloud.drizzle"),
    upNext(id: 1, temp: "41°", time: "8 AM", waetherType: "cloud.sun"),
    upNext(id: 2, temp: "43°", time: "9 AM", waetherType: "cloud.sun"),
    upNext(id: 3, temp: "40°", time: "10 AM", waetherType: "cloud.drizzle"),
    upNext(id: 4, temp: "47°", time: "11 AM", waetherType: "cloud.sun"),
    upNext(id: 5, temp: "50°", time: "12 PM", waetherType: "sun.max")
]





