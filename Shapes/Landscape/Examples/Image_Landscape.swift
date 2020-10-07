//
//  Image_Landscape.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 05.10.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct Image_Landscape: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showText = true
    @State private var showDetails = false
    
    var body: some View {
        ZStack {
            Color.colorBackground
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: -15.0) {
                
                TopViewLandscape()
                
                VStack(spacing: 10.0) {
                    Text("Customization Options")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.colorMainText)
                    Text("You can draw landscape shape on top of anyhting, apply stroke, filling, shadow, oppacity. For exaple draw a landscape on top of an image")
                        .font(.body)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .lineLimit(4)
                        .foregroundColor(Color.colorMainText)
                        .padding([.bottom, .trailing], 14.0)
                        .frame(minWidth: 0, maxWidth: 340, minHeight: 120, maxHeight: 120)
                    
                    Toggle(isOn: self.$showDetails) {
                        Text("Show the Landscape")
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
                        Image("Landscape")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 375, height: 380)
                        
                        ZStack {
                            Base_Landscape(yOffset:0.9)
                                .fill(Color.colorAccent)
                                .frame(width: 575, height: 120)
                                .padding([.top, .leading], 0)
                                .shadow(radius: 10, y: 5)
                                .offset(x: 100, y: -65)
                                .opacity(0.7)
                                .scaleEffect(x: -1, y: -1)
                            
                            
                            Base_Landscape(yOffset:-0.7)
                                .fill(Color.colorThird)
                                .frame(width: 375, height: 110)
                                .padding([.top, .leading], 0)
                                .shadow(radius: 10, y: 5)
                                .offset(x: 0, y: -70)
                                .opacity(0.7)
                                .scaleEffect(x: -1, y: -1)

                            Base_Landscape(yOffset:1.2)
                                .fill(Color.colorAccent)
                                .frame(width: 375, height: 60)
                                .padding([.top, .leading], 0)
                                .shadow(radius: 10, y: 5)
                                .offset(x: 0, y: -95)
                                .opacity(0.7)
                                .scaleEffect(x: -1, y: -1)
                            

                            Base_Landscape(yOffset:1.2)
                                .stroke(Color.colorThird, style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [5, 8]))
                                .frame(width: 375, height: 60)
                                .padding([.top, .leading], 0)
                                .shadow(radius: 10, y: 5)
                                .offset(x: 0, y: -95)
                                .scaleEffect(x: -1, y: -1)
                        }
                        
                    }
                    
                }
                
                BottomViewLandscape()
                
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
            }).edgesIgnoringSafeArea(.all)
        
        
    }
}


struct Image_Landscape_Previews: PreviewProvider {
    static var previews: some View {
        Image_Landscape()
    }
}
