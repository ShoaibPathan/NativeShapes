//
//  Menu_Mountain.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 17.09.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct Menu_Mountain: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var degrees: Double = 0
    @State private var change = false
    @State private var change1 = false
    @State private var change2 = false
    @State var spin = false
    
    var body: some View {
        ZStack {
            Color.colorBackground
            //                VStack(spacing: 10.0) {
            //
            //                    Base_Mountain(xOffset: 1)
            //                        .fill(Color.red)
            //                        .frame(width: 100, height: 30)
            //                        .rotationEffect(.degrees(self.change ? 360: 0))
            //                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            //
            //                        .offset(x: self.change ? -10 : 10, y: self.change ? -200 : 600)
            //                        .onAppear { self.change.toggle() }
            //                    Base_Mountain(xOffset: 0.4)
            //                        .fill(Color.colorAccent)
            //                        .frame(width: 123, height: 100)
            //                        .rotationEffect(.degrees(self.change2 ? 360: 0))
            //                        .animation(Animation.linear(duration: 1.2).repeatForever(autoreverses: false))
            //                        .offset(x: 70, y: self.change2 ? 600 : -400)
            //                        .onAppear { self.change2.toggle() }
            //                    Base_Mountain(xOffset: 0.7)
            //                        .fill(Color.colorSecond)
            //                        .frame(width: 50, height: 90)
            //                        .rotationEffect(.degrees(self.change1 ? 360: 0))
            //                        .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
            //                        .offset(x: 10, y: self.change1 ? 600 : -400)
            //                        .onAppear { self.change1.toggle() }
            //                    Base_Mountain(xOffset: 2)
            //                        .fill(Color.colorSecond)
            //                        .frame(width: 75, height: 75)
            //                        .rotationEffect(.degrees(self.spin ? 360: 0))
            //                        .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
            //                        .offset(x: 30, y: self.spin ? 600 : -400)
            //                        .onAppear { self.spin.toggle() }
            //                }
            
            
            GeometryReader { gp in
                ZStack {
                    Color.colorBackground
                        .edgesIgnoringSafeArea(.all)
                    VStack(spacing: 30.0){
                        
                        TopView()
                        
                        HStack(alignment: .top, spacing: 20) {
                            OptionsView()
                        }
                        
                        Spacer()
                        BottomView()
                        
                    }
                }
                //            }
                
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
}
struct Menu_Mountain_Previews: PreviewProvider {
    static var previews: some View {
        Menu_Mountain()
    }
}

struct OptionsView: View {
    @State private var change = false
    var body: some View {
        VStack(spacing: 30.0) {
            
            ZStack{
                NavigationLink(destination: Options_Mountain()) {
                    Base_Mountain(xOffset: 1)
                        .fill(Color.colorThird)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 90)
                        .scaleEffect(x: -1, y: -1)
                }
                
                NavigationLink(destination: Options_Mountain()) {
                    Base_Mountain(xOffset: 0.7)
                        .fill(Color.colorAccent)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 90)
                        .scaleEffect(x: -1, y: -1)
                        .opacity(0.8)
                        .overlay(
                            Text("Basic")
                                .font(.title)
                                .fontWeight(.thin)
                                .foregroundColor(Color.colorMainText)
                                .multilineTextAlignment(.center)
                                .padding([.bottom, .trailing], 40.0))
                }
            }
            
            ZStack{
                NavigationLink(destination: Image_Mountain()) {
                    Base_Mountain(xOffset: 0.6)
                        .fill(Color.colorThird)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 90)
                        .scaleEffect(x: -1, y: -1)
                }
                
                NavigationLink(destination: Image_Mountain()) {
                    Base_Mountain(xOffset:0.3)
                        .fill(Color.colorAccent)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 90)
                        .opacity(0.9)
                        .overlay(
                            Text("Advanced")
                                .font(.title)
                                .fontWeight(.thin)
                                .foregroundColor(Color.colorMainText)
                                .multilineTextAlignment(.center)
                                .padding([.top, .trailing], 35))
                }
            }
            
            
            ZStack{
                NavigationLink(destination: Animation_Mountain()) {
                    Base_Mountain(xOffset: 1)
                        .fill(Color.colorThird)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 90)
                }
                
                NavigationLink(destination: Animation_Mountain()) {
                    Base_Mountain(xOffset: 0.7)
                        .fill(Color.colorAccent)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 90)
                        .opacity(0.7)
                        .overlay(
                            Text("Animation")
                                .font(.title)
                                .fontWeight(.thin)
                                .foregroundColor(Color.colorMainText)
                                .multilineTextAlignment(.center)
                                .padding(.top, 45.0))
                    
                }
            }
            
            ZStack{
                NavigationLink(destination: Code_Mountain()) {
                    Base_Mountain(xOffset: 0.9)
                        .fill(Color.colorThird)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 90)
                    
                }
                
                NavigationLink(destination: Code_Mountain()) {
                    Base_Mountain(xOffset: 0.1)
                        .fill(Color.colorAccent)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 90)
                        .opacity(0.8)
                        .overlay(
                            Text("Code")
                                .font(.title)
                                .fontWeight(.thin)
                                .foregroundColor(Color.colorMainText)
                                .padding([.top, .leading, .trailing], 45.0))
                }
            }
            
        }
    }
}


struct BottomView: View {
    
    @State private var show01 = false
    @State private var show02 = false
    @State private var show03 = false
    @State private var show04 = false
    @State private var show05 = false
    @State private var show06 = false
    
    var body: some View {
        VStack(){
            //            Color.colorBackground
            VStack(spacing: 1){
                ZStack {
                    //                    Base_Mountain(xOffset: 1)
                    //                        .fill(Color.red)
                    //                        .frame(width: 350, height: 150)
                    //                        .offset(x: 0)
                    Base_Mountain(xOffset: -4)
                        .fill(Color.colorThird)
                        .frame(width: 80, height: 150.0)
                        .offset(x: -70)
                        .opacity(0.9)
                        .onAppear { self.show01.toggle() }
                        .opacity(self.show01 ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 0.5)
                                    .repeatCount(5))
                    Base_Mountain(xOffset: -1)
                        .fill(Color.colorAccent)
                        .frame(width: 80, height: 150.0)
                        .offset(x: -70)
                        .opacity(0.9)
                        .onAppear { self.show02.toggle() }
                        .opacity(self.show02 ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 0.6)
                                    .repeatCount(5))
                    Base_Mountain(xOffset: 0.9)
                        .fill(Color.colorThird)
                        .frame(width: 80, height: 150.0)
                        .shadow(radius: 4)
                        .offset(x: -70)
                        .opacity(0.9)
                        .shadow(radius: 2, y: 2)
                        .onAppear { self.show03.toggle() }
                        .opacity(self.show03 ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 0.7)
                                    .repeatCount(5))
                    Base_Mountain(xOffset: -0.3)
                        .fill(Color.colorSecond)
                        .frame(width: 80, height: 150.0)
                        .offset(x: -70)
                        .opacity(0.9)
                        .onAppear { self.show04.toggle() }
                        .opacity(self.show04 ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 0.8)
                                    .repeatCount(5))
                    Base_Mountain(xOffset: 3)
                        .fill(Color.colorAccent)
                        .frame(width: 80, height: 150.0)
                        .shadow(radius: 4)
                        .offset(x: -70)
                        .opacity(0.9)
                        .shadow(radius: 2, y: 2)
                        .onAppear { self.show05.toggle() }
                        .opacity(self.show05 ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 0.9)
                                    .repeatCount(5))
                    Base_Mountain(xOffset: 6)
                        .fill(Color.colorSecond)
                        .frame(width: 80, height: 150.0)
                        .shadow(radius: 4)
                        .offset(x: -70)
                        .opacity(0.9)
                        .shadow(radius: 2, y: 2)
                        .onAppear { self.show06.toggle() }
                        .opacity(self.show06 ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1.0)
                                    .repeatCount(5))
                }
            }
        }//.edgesIgnoringSafeArea(.all)
    }
}

struct TopView: View {
    var body: some View {
        
        ZStack {
            //            Color.colorBackground
            
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
                .overlay(Text("Mountain Options")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.colorMainText)
                            .multilineTextAlignment(.center))
        }
    }
}

