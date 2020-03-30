//
//  TipsView.swift
//  COVID-19
//
//  Created by Santosh Botre on 27/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI

struct TipsView: View {
    
    var data = tipsData
    
    @State var showContent = false
   // @ObservedObject var fetcher = AllCountriesStatusRequester()
    
    var body: some View {
        
        VStack {
            HStack {
            Text("Tips")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.leading, 30)
                Spacer()
            }
         
            ScrollView(.horizontal, showsIndicators: false) {
               HStack(spacing: 20.0) {
                ForEach(data) { item in
                     Button(action: { self.showContent.toggle()}) {
                        GeometryReader { geometry in
                           CourseView(title: item.title,
                                      image: item.image,
                                      color: item.color,
                                      shadowColor: Color("backgroundShadow4"))
                              .rotation3DEffect(Angle(degrees:
                                 Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10.0, z: 0))
//                              .sheet(isPresented: self.$showContent) {
//                                TipsDetailView(tip: item)
//                            }
                        }
                        .frame(width: 246, height: 300)
                     }.tag(item.index)
                  }
               }
               .padding(.leading)
            }

        }
    }
}
struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}

struct CardBottomView: View {
    var description = "Build an app with SwiftUI"
   var body: some View {
      return VStack(spacing: 20.0) {
         Rectangle()
            .frame(width: 60, height: 6)
            .cornerRadius(3.0)
            .opacity(0.1)

         Text(description)
            .lineLimit(nil)

         Spacer()
      }
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding()
      .padding(.horizontal)
      //.background(BlurView(style: .systemMaterial))
      .cornerRadius(30)
      .shadow(radius: 20)
      //.offset(y: UIScreen.main.bounds.height - 215)
   }
}

struct CourseView: View {

   var title = "Build an app with SwiftUI"
    var image: String
   var color = Color("background3")
   var shadowColor = Color("backgroundShadow3")

   var body: some View {
      return VStack(alignment: .leading) {
         Text(title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(20)
            .lineLimit(3)

        Spacer(minLength: 5)

         Image(image)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 246, height: 130)
            .padding(.bottom)
      }
      .background(color)
      .cornerRadius(30)
      .frame(width: 246, height: 300)
      .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
   }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
