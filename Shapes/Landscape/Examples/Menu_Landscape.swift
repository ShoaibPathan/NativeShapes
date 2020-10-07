//
//  Menu_Landscape.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 30.09.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct Menu_Landscape: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var degrees: Double = 0
    @State private var changeNew = false
    @State private var change1 = false
    @State private var change2 = false
    @State var spin = false
    
    
    var body: some View {
        ZStack {
            Color.colorBackground
            VStack(spacing: 30.0){
                
                TopViewLandscape()

                HStack(alignment: .top) {
                    OptionsView1()
                }

                Spacer()
                
                BottomViewLandscape()

            }
            
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
            
            
            .edgesIgnoringSafeArea(.all)
        }
    }
    
}
struct Menu_Landscape_Previews: PreviewProvider {
    static var previews: some View {
        Menu_Landscape()
    }
}

struct OptionsView1: View {
    @State private var change = false
    var body: some View {
        VStack(spacing: 30.0) {
            
            
            
            
            ZStack{
                NavigationLink(destination: Options_Landscape()) {
                    Base_Landscape(yOffset: 1)
                        .fill(Color.colorThird)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 70)
                        .scaleEffect(x: 1, y: -1)
                }
                
                NavigationLink(destination: Options_Landscape()) {
                    Base_Landscape(yOffset: 0.7)
                        .fill(Color.colorAccent)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 70)
                        .scaleEffect(x: -1, y: -1)
                        .opacity(0.8)
                        .overlay(
                            Text("Basic")
                                .font(.title)
                                .fontWeight(.thin)
                                .foregroundColor(Color.colorMainText)
                                .multilineTextAlignment(.center)
                                .padding([.bottom, .trailing], 0.0))
                }
            }
            
            ZStack{
                NavigationLink(destination: Image_Landscape()) {
                    Base_Landscape(yOffset: -1.2)
                        .fill(Color.colorThird)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 70)
                }
                
                NavigationLink(destination: Image_Landscape()) {
                    Base_Landscape(yOffset:1.3)
                        .fill(Color.colorAccent)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 70)
                        .opacity(0.9)
                        .overlay(
                            Text("Advanced")
                                .font(.title)
                                .fontWeight(.thin)
                                .foregroundColor(Color.colorMainText)
                                .multilineTextAlignment(.center)
                                .padding([.top, .trailing], 5))
                }
            }
            .padding(.bottom, 50.0)
            
            ZStack{
                NavigationLink(destination: Animation_Landscape()) {
                    Base_Landscape(yOffset: 1.8)
                        .fill(Color.colorThird)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 60)
                        .scaleEffect(x: 1, y: -1)
                }
                
                NavigationLink(destination: Animation_Landscape()) {
                    Base_Landscape(yOffset: 0.7)
                        .fill(Color.colorAccent)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 60)
                        .scaleEffect(x: 1, y: -1)
                        .opacity(0.4)
                        .overlay(
                            Text("Animation")
                                .font(.title)
                                .fontWeight(.thin)
                                .foregroundColor(Color.colorMainText)
                                .multilineTextAlignment(.center)
                                .padding(.top, 5.0))
                    
                }
            }
            
            ZStack{
                NavigationLink(destination: Code_Mountain()) {
                    Base_Landscape(yOffset: 3.1)
                        .fill(Color.colorThird)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 60)
                }
                
                NavigationLink(destination: Code_Mountain()) {
                    Base_Landscape(yOffset: -4.1)
                        .fill(Color.colorThird)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 60)
                }
                
                NavigationLink(destination: Code_Landscape()) {
                    Base_Landscape(yOffset: -1.8)
                        .fill(Color.colorAccent)
                        .shadow(radius: 5, y: 5)
                        .frame(width: 250, height: 60)
                        .opacity(0.8)
                        .overlay(
                            Text("Code")
                                .font(.title)
                                .fontWeight(.thin)
                                .foregroundColor(Color.colorMainText)
                                .padding([.top, .leading, .trailing], 5.0))
                }
            }
            
        }
    }
}


struct BottomViewLandscape: View {
    
    
    @State private var road = false
    
    @State private var show01 = false
    var body: some View {
        ZStack(alignment: .bottom){
        Base_Landscape(yOffset: show01 ? 0.5 : -0.5)
            .fill(Color.colorAccent)
            .opacity(0.8)
            .frame(height: 50.0)
            .shadow(radius: 4)
            .scaleEffect(x: 1, y: -1)
        
        Base_Landscape(yOffset: show01 ? -0.7 : 0.7)
            .fill(Color.colorAccent)
            .opacity(0.8)
            .frame(height: 70.0)
            .shadow(radius: 4)
            .scaleEffect(x: 1, y: -1)
        }
    }
}


struct TopViewLandscape: View {
    var body: some View {
        
        ZStack(alignment: .top) {
            Base_Landscape(yOffset: -1.5)
                .fill(Color.colorAccent)
                .frame(height: 90)
                .shadow(radius: 4)
            Base_Landscape()
                .fill(Color.colorAccent)
                .frame(height: 120.0)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .shadow(radius: 5, y: 5)
            Base_Landscape(yOffset: 0.25)
                .fill(Color.colorSecond)
                .frame(height: 100.0)
                .scaleEffect(x: -1, y: 1)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .overlay(Text("Landscape Options")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.colorMainText)
                            .multilineTextAlignment(.center))
            
        }
        .padding(.bottom, 50.0)
    }
}

