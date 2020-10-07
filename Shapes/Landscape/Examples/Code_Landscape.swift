//
//  Code_Landscape.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 05.10.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct Code_Landscape: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var show01 = false
    @State private var show02 = false
    @State private var show03 = false
    @State private var show04 = false
    @State private var show05 = false
    @State private var show06 = false
    @State private var show07 = false
    
    @State private var dampingFraction = 0.8
    
    @State private var presentingSheet = false
    
    @State private var details: DetailInfo? = nil
    
    var message = ""
    
    
    
    var body: some View {
        ZStack {
            Color.colorBackground
            GeometryReader { gp in
                VStack(spacing: 6.0){
                    
                    TopViewLandscape()
                    
                    Spacer()
                    
                    VStack(spacing: 0.0){
                        HStack{
                            ZStack{
                                Base_Landscape()
                                    .fill(Color.colorThird)
                                    .previewLayout(.sizeThatFits)
                                    .frame(width: 200.0, height: 80.0)
                                Button(action: { self.details = DetailInfo(image: Image("Base_L"), header: Text("Base landscape "), sub: Text("Code that makes the landscape")
                                    )}) {
                                        Image(systemName: "questionmark.circle")
                                            .padding(.bottom, 20.0)
                                            .font(.system(size: 30))
                                            .foregroundColor(Color.colorMainText)
                                }
                            }
                        }
                        HStack {
                            VStack {
                                ZStack{
                                    Base_Landscape()
                                        .fill(Color.colorThird)
                                        .previewLayout(.sizeThatFits)
                                        .frame(width: 100.0, height: 100.0)
                                    Button(action: { self.details = DetailInfo(image: Image("Offset_None_L"), header: Text("Offset: None"), sub: Text("Base landscape, no offset is used")
                                        )}) {
                                            Image(systemName: "1.circle")
                                                .padding([.top, .trailing], 0.0)
                                                .font(.system(size: 30))
                                                .foregroundColor(Color.colorMainText)
                                    }
                                    .onAppear { self.show01.toggle() }
                                    .scaleEffect(self.show01 ? 1 : 0.001)
                                    .opacity(self.show01 ? 1 : 0)
                                    .animation(Animation.interpolatingSpring(stiffness: 50, damping: 4))
                                }
                                .padding(.top, 20.0)
                                .sheet(item: self.$details) { detailInfo in
                                    DetailSheetLand(details: detailInfo)
                                }
                            }
                            
                            VStack {
                                ZStack{
                                    Base_Landscape(yOffset: 0.5)
                                        .fill(Color.colorThird)
                                        .previewLayout(.sizeThatFits)
                                        .frame(width: 100.0, height: 80.0)
                                        .scaleEffect(x: 1, y: -1)
                                    Button(action: { self.details = DetailInfo(image: Image("Offset_05_L"), header: Text("Offset: 0.5"), sub: Text("Base landscape, 0.5 offset and y:-1 to flip it"))}) {
                                        Image(systemName: "2.circle")
                                            .padding(.bottom, 20.0)
                                            .font(.system(size: 30))
                                            .foregroundColor(Color.colorMainText)
                                    }
                                    .onAppear { self.show02.toggle() }
                                    .scaleEffect(self.show02 ? 1 : 0.001)
                                    .opacity(self.show02 ? 1 : 0)
                                    .animation(Animation.interpolatingSpring(stiffness: 50, damping: 4)
                                    .delay(0.5))
                                }
                                .padding(.top, 80.0)
                                .sheet(item: self.$details) { detailInfo in
                                    DetailSheetLand(details: detailInfo)
                                }
                            }
                            
                            VStack {
                                ZStack{
                                    Base_Landscape(yOffset: 1)
                                        .fill(Color.colorThird)
                                        .previewLayout(.sizeThatFits)
                                        .frame(width: 100.0, height: 100.0)
                                    Button(action: { self.details = DetailInfo(image: Image("Offset_1_L"), header: Text("Offset: 1"), sub: Text("Base landscape, 1 offset"))}) {
                                        Image(systemName: "3.circle")
                                            .padding([.top, .leading], 0.0)
                                            .font(.system(size: 30))
                                            .foregroundColor(Color.colorMainText)
                                    }
                                    .onAppear { self.show03.toggle() }
                                    .scaleEffect(self.show03 ? 1 : 0.001)
                                    .opacity(self.show03 ? 1 : 0)
                                    .animation(Animation.interpolatingSpring(stiffness: 50, damping: 4)
                                    .delay(0.6))
                                }
                                .padding(.top, 20.0)
                                .sheet(item: self.$details) { detailInfo in
                                    DetailSheetLand(details: detailInfo)
                                }
                            }
                        }
                        
                        Spacer()
                        HStack(alignment: .center) {
                            ZStack{
                                Base_Landscape(yOffset: -1.5)
                                    .fill(Color.colorThird)
                                    .previewLayout(.sizeThatFits)
                                    .frame(width: 120.0, height: 50.0)
                                Button(action: {self.details = DetailInfo(image: Image("Offset_Min15_L"), header: Text("Offset: -1.5"), sub: Text("Base landscape, -1.5 offset"))}) {
                                    Image(systemName: "4.circle")
                                        .padding(.leading, 40.0)
                                        .font(.system(size: 30))
                                        .foregroundColor(Color.colorMainText)
                                }
                                .onAppear { self.show04.toggle() }
                                .scaleEffect(self.show04 ? 1 : 0.001)
                                .opacity(self.show04 ? 1 : 0)
                                .animation(Animation.interpolatingSpring(stiffness: 50, damping: 4)
                                .delay(0.7))
                            }
                            .padding(.top, 20.0)
                            .sheet(item: self.$details) { detailInfo in
                                DetailSheetLand(details: detailInfo)
                            }
                            
                            Spacer()
                            ZStack{
                                Base_Landscape(yOffset: 6)
                                    .fill(Color.colorThird)
                                    .previewLayout(.sizeThatFits)
                                    .frame(width: 140.0, height: 50.0)
                                    .scaleEffect(x: 1, y: 1)
                                Button(action: {self.details = DetailInfo(image: Image("Offset_6_L"), header: Text("Offset: 6"), sub: Text("Base landscape, 6 offset"))}) {
                                    Image(systemName: "5.circle")
                                        .font(.system(size: 30))
                                        .padding(.leading, -20.0)
                                        .foregroundColor(Color.colorMainText)
                                }
                                .onAppear { self.show05.toggle() }
                                .scaleEffect(self.show05 ? 1 : 0.001)
                                .opacity(self.show05 ? 1 : 0)
                                .animation(Animation.interpolatingSpring(stiffness: 50, damping: 4)
                                .delay(0.8))
                            }
                            .padding(.top, 20.0)
                            .sheet(item: self.$details) { detailInfo in
                                DetailSheetLand(details: detailInfo)
                            }
                        }
                        .frame(width: 300.0)
                        Spacer()
                        
                        HStack(alignment: .center) {
                            ZStack{
                                Base_Landscape(yOffset: 1.5)
                                    .fill(Color.colorThird)
                                    .previewLayout(.sizeThatFits)
                                    .scaleEffect(x: 1, y: -1)
                                    .frame(width: 120.0, height: 50.0)
                                Button(action: {self.details = DetailInfo(image: Image("Offset_15_L"), header: Text("Offset: 1.5"), sub: Text("Base landscape, 1.5 offset"))}) {
                                    Image(systemName: "6.circle")
                                        .padding(.leading, -10.0)
                                        .font(.system(size: 30))
                                        .foregroundColor(Color.colorMainText)
                                }
                                .onAppear { self.show06.toggle() }
                                .scaleEffect(self.show06 ? 1 : 0.001)
                                .opacity(self.show06 ? 1 : 0)
                                .animation(Animation.interpolatingSpring(stiffness: 50, damping: 4)
                                .delay(0.9))
                            }
                            .padding(.top, 20.0)
                            .sheet(item: self.$details) { detailInfo in
                                DetailSheetLand(details: detailInfo)
                            }
                            
                            Spacer()
                            ZStack{
                                Base_Landscape(yOffset: 5)
                                    .fill(Color.colorThird)
                                    .previewLayout(.sizeThatFits)
                                    .frame(width: 80.0, height: 70.0)
                                    .scaleEffect(x: -1, y: -1)
                                Button(action: {self.details = DetailInfo(image: Image("Offset_5_L"), header: Text("Offset: 5"), sub: Text("Base landscape, 5 offset"))}) {
                                    Image(systemName: "7.circle")
                                        .font(.system(size: 30))
                                        .padding(.leading, 30.0)
                                        .foregroundColor(Color.colorMainText)
                                }
                                .onAppear { self.show07.toggle() }
                                .scaleEffect(self.show07 ? 1 : 0.001)
                                .opacity(self.show07 ? 1 : 0)
                                .animation(Animation.interpolatingSpring(stiffness: 50, damping: 4)
                                .delay(1.0))
                            }
                            .padding(.top, 20.0)
                            .sheet(item: self.$details) { detailInfo in
                                DetailSheetLand(details: detailInfo)
                            }
                        }
                        .frame(width: 300.0)
                    }
                    BottomViewLandscape()
                }
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

struct Code_Landscape_Previews: PreviewProvider {
    static var previews: some View {
        Code_Landscape()
    }
}

struct DetailSheetLand: View {
    @State private var showClose = false
    @State private var response = 0.55
    
    @Environment(\.presentationMode) var presentation
    let details: DetailInfo
    
    var body: some View {
        VStack(spacing: 20) {
            TopViewLandscape()
            details.header
                .font(.title)
                .fontWeight(.thin)
                .foregroundColor(.colorMainText)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .frame(width: 320)
            details.sub
                .font(.subheadline)
                .fontWeight(.thin)
                .foregroundColor(.colorMainText)
            
            ZStack{
                details.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300.0, height: 330.0)
                Button(action: {self.presentation.wrappedValue.dismiss()}) {
                    Image(systemName: "multiply.circle.fill")
                        .padding([.top, .leading], 310.0)
                        .font(.system(size: 30))
                        .foregroundColor(Color.colorMainText)
                }  .onAppear { self.showClose.toggle() }
                .scaleEffect(self.showClose ? 1 : 0.01, anchor: .bottomTrailing)
                .opacity(self.showClose ? 1 : 0)
                .animation(.spring(response: response, dampingFraction: 0.5))
            }
            .padding(.bottom)
            BottomViewLandscape()
            
        }.background(Color.colorBackground)
        .edgesIgnoringSafeArea(.all)
    }
}
