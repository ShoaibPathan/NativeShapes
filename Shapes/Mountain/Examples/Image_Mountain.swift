//
//  Image_Mountain.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 17.09.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct Image_Mountain: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showText = true
    @State private var showDetails = false
    
    var body: some View {
        GeometryReader { gp in
            ZStack {
                Color.colorBackground
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: -15.0) {
                    
                    TopView()
                    
                    VStack(spacing: 10.0) {
                        Text("Customization Options")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.colorMainText)
                        Text("You can draw triangles on top of anyhting, apply stroke, filling, shadow, oppacity. For exaple draw the pyramids of Giza on top of an image")
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .lineLimit(4)
                            .foregroundColor(Color.colorMainText)
                            .padding([.bottom, .trailing], 14.0)
                            .frame(minWidth: 0, maxWidth: 340, minHeight: 120, maxHeight: 120)
                        
                        Toggle(isOn: self.$showDetails) {
                            Text("Show the Pyramids")
                                .font(.body)
                                .fontWeight(.light)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal)
                                .foregroundColor(Color.colorMainText)
                                .accentColor(Color.colorAccent)
                        }.padding([.bottom, .trailing], 14.0)
                            .frame(minWidth: 0, maxWidth: 340)
                    }
                    //                    .padding()
                    
                    Spacer()
                    if self.showDetails {
                        
                        ZStack {
                            Image("Pyramids")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 375, height: 380)
                            
                            ZStack {
                                Base_Mountain(xOffset:0.5)
                                    .fill(Color.colorAccent)
                                    .frame(width: 130, height: 60)
                                    .padding([.top, .leading], 0)
                                    .shadow(radius: 10, y: 5)
                                    .offset(x: 115, y: 30)
                                    .opacity(0.7)
                                Base_Mountain(xOffset:0.5)
                                    .stroke(Color.colorThird, style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [5, 8]))
                                    .frame(width: 130, height: 60)
                                    .padding([.top, .leading], 0)
                                    .shadow(radius: 10, y: 5)
                                    .offset(x: 115, y: 30)
                                Base_Mountain(xOffset:0.5)
                                    .stroke(Color.colorThird, style: StrokeStyle(lineWidth: 4, lineCap: .round, dash: [5, 9]))
                                    .frame(width: 180, height: 100)
                                    .padding([.top, .leading], 0)
                                    .shadow(radius: 10, y: 5)
                                    .offset(x: 40, y: 10)
                                Base_Mountain(xOffset:0.5)
                                    .fill(Color.colorAccent)
                                    .frame(width: 180, height: 100)
                                    .padding([.top, .leading], 0)
                                    .shadow(radius: 10, y: 5)
                                    .offset(x: 40, y: 10)
                                    .opacity(0.7)
                                Base_Mountain(xOffset:0.55)
                                    .fill(Color.colorAccent)
                                    .frame(width: 165, height: 90)
                                    .padding([.top, .leading], 0)
                                    .shadow(radius: 10, y: 5)
                                    .offset(x: -54, y: 27)
                                    .opacity(0.7)
                                Base_Mountain(xOffset:0.55)
                                    .stroke(Color.colorThird, style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [5, 4]))
                                    .frame(width: 165, height: 90)
                                    .padding([.top, .leading], 0)
                                    .shadow(radius: 10, y: 5)
                                    .offset(x: -54, y: 27)
                                
                            }
                            
                        }
                        
                    }
                    
                    BottomView()
                    
                }.foregroundColor(.colorForeground)
                    .animation(.easeIn(duration: 2))
                
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
            
            
        }.edgesIgnoringSafeArea(.all)
    }
    
}
struct Image_Mountain_Previews: PreviewProvider {
    static var previews: some View {
        Image_Mountain()
    }
}
