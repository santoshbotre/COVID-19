//
//  WorldWideStatusView.swift
//  COVID-19
//
//  Created by Santosh Botre on 27/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI

struct WorldWideStatusView: View {
    
    @State var showContent = false
   
    var body: some View {
        VStack() {
            Text("World Wide Status")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .offset(x: 0)
    
            HStack {
                StatusView(color: Color("background4"))
                    .padding(.all)
            }
        }
    }
}

struct StatusBannerView: View {
    var icon: String
    var color: Color
    var title: String
    var subTitle: String
    var body: some View {
        ZStack {
            HStack {
                Image(icon)
                .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    
                VStack (alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(Color("primary"))

                    Text(subTitle)
                        .font(.headline)
                        .foregroundColor(Color("primary"))
                    }
                }
            }
        }
}

struct StatusView: View {
 @ObservedObject var requester = WorldWideRequester()
   var color = Color("background3")
   var shadowColor = Color("backgroundShadow3")

   var body: some View {
      return
        HStack (alignment: .top) {
            VStack (alignment: .leading) {
                StatusBannerView(icon: "cases", color: .red, title: "Cases ", subTitle: "\(requester.worldWideCoronaStatus?.cases ?? 0)")
    
                .padding(.all, 10)
    
                StatusBannerView(icon: "recovered", color: .red, title: "Recovered ", subTitle: "\(requester.worldWideCoronaStatus?.recovered ?? 0)")
                        
                    .padding(.all, 10)
                }
            
            Spacer()
        
                VStack (alignment: .leading) {
                    StatusBannerView(icon: "deaths", color: .red, title: "Deaths ", subTitle: "\(requester.worldWideCoronaStatus?.deaths ?? 0)")
            
                    .padding(.all, 10)
                }
        }
      .background(color)
      .cornerRadius(20)
      .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
    
}
