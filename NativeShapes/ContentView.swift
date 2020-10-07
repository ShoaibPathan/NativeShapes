//
//  ContentView.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 02.07.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                VStack(spacing: 140.0) {
                    HStack(spacing: 16.0) {
                        NavigationLink(destination: Menu_Mountain()) {
                            Base_Mountain(xOffset: 0.5)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.colorSnow, Color.colorMountainTop, Color.colorMountainMid]), startPoint: .top, endPoint: .bottom))
                                .shadow(radius: 1, y: -1)
                                .frame(width: 44.0, height: 24.0)
                                .padding(.all, 10)
                            Text("Mountain")
                        }
                    }
                }
                VStack(spacing: 140.0) {
                    HStack(spacing: 10.0) {
                         NavigationLink(destination: Menu_Landscape())
                        {
                        Base_Landscape()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.colorGrass, Color.colorMeadow]), startPoint: .bottomTrailing, endPoint: .topLeading))
                            .shadow(radius: 1, y: 1)
                            .frame(width: 44.0, height: 20.0)
                            .padding(.all, 10)
                            .scaleEffect(x: 1, y: -1)
                        Text("Lanscape")
                    }
                }
                }
                
                VStack(spacing: 140.0) {
                    HStack(spacing: 10.0) {
                        Base_House(offset: 0.5, corner: .topRight)
                            .fill(Color.colorSkyDay)
                            .shadow(radius: 5, y: 5)
                            .frame(width: 44.0, height: 24.0)
                            .padding(.all, 10)
                        Text("House - Coming soon")
                    }
                }
                
                VStack(spacing: 140.0) {
                    HStack(spacing: 25.0) {
                        Base_Drop()
                            .fill(LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .topLeading, endPoint: .bottom))
                            .frame(width: 34.0, height: 24.0)
                            .shadow(radius: 5, y: 5)
                            .padding(.leading)
                        Text("Drop - Coming soon")
                    }
                }
                
                VStack(spacing: 140.0) {
                    HStack(spacing: 10.0) {
                        //                            NavigationLink(destination: Menu_Mountain()) {
                        Base_Curving(topOffset: 12, bottomOffset: 12)
                            .fill(RadialGradient(gradient: Gradient(colors: [.black, .blue]), center: .center, startRadius: 1, endRadius: 7))
                            .shadow(radius: 5, y: 5)
                            .frame(width: 44.0, height: 24.0)
                            .padding(.all, 10)
                            .scaleEffect(x: 1, y: -1)
                        Text("Curves - Coming soon")
                    }
                }
                
                VStack(spacing: 140.0) {
                    HStack(spacing: 16.0) {
                        NavigationLink(destination: NativeShapes_Colors()) {
                            VStack(){
                                HStack(){
                                    Rectangle()
                                        .fill(Color.colorMeadow)
                                        .shadow(radius: 2, y: 2)
                                        .frame(width: 14.0, height: 14.0)
                                    Rectangle()
                                        .fill(Color.colorSkyDay)
                                        .shadow(radius: 2, y: 2)
                                        .frame(width: 14.0, height: 14.0)
                                }
                                
                                HStack(){
                                    Rectangle()
                                        .fill(Color.colorMountainMid)
                                        .shadow(radius: 2, y: 2)
                                        .frame(width: 14.0, height: 14.0)
                                    Rectangle()
                                        .fill(Color.colorAccent)
                                        .shadow(radius: 2, y: 2)
                                        .frame(width: 14.0, height: 14.0)
                                }
                            }
                            .padding(.horizontal, 14.0)
                            Text("Colors used (more info soon)")
                        }
                    }
                }
                
            }
            
            //        TODO: Update list
            //            .listStyle(SidebarListStyle())
            
            .navigationBarTitle("Menu")
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //            ContentView()
            //                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            //                .previewDisplayName("iPhone 8")
            ContentView()
                //              .preferredColorScheme(.dark)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                .previewDisplayName("iPhone 11 Pro")
        }
    }
}
