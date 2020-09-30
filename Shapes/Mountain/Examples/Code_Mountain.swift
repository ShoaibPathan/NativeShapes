//
//  Code_Mountain.swift
//  NativeShapes
//
//  Created by Erik Kuipers on 17.09.20.
//  Copyright © 2020 Erik Kuipers. All rights reserved.
//

import SwiftUI

struct DetailInfo: Identifiable {
    var id = UUID() // Conform to Identifiable
    let image: Image
    let header: Text
    let sub: Text
}

struct Code_Mountain: View {
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
                        
                        TopView()
                        
                        Spacer()
                        
                        VStack(spacing: 0.0){
                            HStack{
                                ZStack{
                                    Base_Mountain()
                                        .fill(Color.colorThird)
                                        .previewLayout(.sizeThatFits)
                                        .frame(width: 100.0, height: 100.0)
                                        .rotationEffect(.degrees(135))
                                    Button(action: { self.details = DetailInfo(image: Image("Offset_None"), header: Text("Base triangle with a rotationEffect of 135°"), sub: Text("Code that makes the triangle")
                                        )}) {
                                            Image(systemName: "questionmark.circle")
                                                .padding(.bottom, 60.0)
                                                .font(.system(size: 30))
                                                .foregroundColor(Color.colorMainText)
                                    }
                                }
                            }
                            HStack {
                                VStack {
                                    ZStack{
                                        Base_Mountain()
                                            .fill(Color.colorThird)
                                            .previewLayout(.sizeThatFits)
                                            .frame(width: 100.0, height: 100.0)
                                        Button(action: { self.details = DetailInfo(image: Image("Offset_None"), header: Text("Offset: None"), sub: Text("Base triangle, no offset is used")
                                            )}) {
                                                Image(systemName: "1.circle")
                                                    .padding([.top, .trailing], 50.0)
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
                                        DetailSheet(details: detailInfo)
                                    }
                                }
                                
                                VStack {
                                    ZStack{
                                        Base_Mountain(xOffset: 0.5)
                                            .fill(Color.colorThird)
                                            .previewLayout(.sizeThatFits)
                                            .frame(width: 100.0, height: 100.0)
                                            .scaleEffect(x: 1, y: -1)
                                        Button(action: { self.details = DetailInfo(image: Image("Offset_05"), header: Text("Offset: 0.5"), sub: Text("Base triangle, 0.5 offset and y:-1 to flip it"))}) {
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
                                    .padding(.top, 20.0)
                                    .sheet(item: self.$details) { detailInfo in
                                        DetailSheet(details: detailInfo)
                                    }
                                }
                                
                                VStack {
                                    ZStack{
                                        Base_Mountain(xOffset: 1)
                                            .fill(Color.colorThird)
                                            .previewLayout(.sizeThatFits)
                                            .frame(width: 100.0, height: 100.0)
                                        Button(action: { self.details = DetailInfo(image: Image("Offset_1"), header: Text("Offset: 1"), sub: Text("Base triangle, 1 offset"))}) {
                                            Image(systemName: "3.circle")
                                                .padding([.top, .leading], 50.0)
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
                                        DetailSheet(details: detailInfo)
                                    }
                                }
                            }
                            
                            Spacer()
                            HStack(alignment: .center) {
                                ZStack{
                                    Base_Mountain(xOffset: 1.5)
                                        .fill(Color.colorThird)
                                        .previewLayout(.sizeThatFits)
                                        .frame(width: 80.0, height: 100.0)
                                    Button(action: {self.details = DetailInfo(image: Image("Offset_15"), header: Text("Offset: 1.5"), sub: Text("Base triangle, 1.5 offset"))}) {
                                        Image(systemName: "4.circle")
                                            .padding([.top, .leading], 50.0)
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
                                    DetailSheet(details: detailInfo)
                                }
                                
                                Spacer()
                                ZStack{
                                    Base_Mountain(xOffset: 2)
                                        .fill(Color.colorThird)
                                        .previewLayout(.sizeThatFits)
                                        .frame(width: 100.0, height: 100.0)
                                        .scaleEffect(x: -1, y: -1)
                                    Button(action: {self.details = DetailInfo(image: Image("Offset_2"), header: Text("Offset: 2"), sub: Text("Base triangle, 2.0 offset"))}) {
                                        Image(systemName: "5.circle")
                                            .font(.system(size: 30))
                                            .padding([.bottom, .trailing], 60.0)
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
                                    DetailSheet(details: detailInfo)
                                }
                            }
                            .frame(width: 300.0)
                            Spacer()
                            
                            HStack(alignment: .center) {
                                ZStack{
                                    Base_Mountain(xOffset: 2.5)
                                        .fill(Color.colorThird)
                                        .previewLayout(.sizeThatFits)
                                        .scaleEffect(x: 1, y: -1)
                                        .frame(width: 120.0, height: 100.0)
                                    Button(action: {self.details = DetailInfo(image: Image("Offset_25"), header: Text("Offset: 2.5"), sub: Text("Base triangle, 2.5 offset"))}) {
                                        Image(systemName: "6.circle")
                                            .padding([.top, .leading], 50.0)
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
                                    DetailSheet(details: detailInfo)
                                }
                                
                                Spacer()
                                ZStack{
                                    Base_Mountain(xOffset: 4)
                                        .fill(Color.colorThird)
                                        .previewLayout(.sizeThatFits)
                                        .frame(width: 20.0, height: 100.0)
                                        .scaleEffect(x: -1, y: -1)
                                    Button(action: {self.details = DetailInfo(image: Image("Offset_4"), header: Text("Offset: 4"), sub: Text("Base triangle, 4 offset"))}) {
                                        Image(systemName: "7.circle")
                                            .font(.system(size: 30))
                                            .padding([.bottom, .trailing], 60.0)
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
                                    DetailSheet(details: detailInfo)
                                }
                            }
                            .frame(width: 300.0)
                        }
                        BottomView()
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

struct Code_Mountain_Previews: PreviewProvider {
    static var previews: some View {
        Code_Mountain()
    }
}

struct DetailSheet: View {
    @State private var showClose = false
    @State private var response = 0.55
    
    @Environment(\.presentationMode) var presentation
    let details: DetailInfo
    
    var body: some View {
        VStack(spacing: 20) {
            TopView()
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
            BottomView()
            
        }.background(Color.colorBackground)
            .edgesIgnoringSafeArea(.all)
    }
}

