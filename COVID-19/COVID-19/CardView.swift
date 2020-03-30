//
//  CardView.swift
//  COVID-19
//
//  Created by Santosh Botre on 26/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI

struct CardView: View {

   var title: String
   var count: Int
    
   var color = Color("background3")
   var shadowColor = Color("backgroundShadow3")

   var body: some View {
      return VStack(alignment: .leading) {
         Text(title)
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(10)
            .lineLimit(4)
        
        Text("\(count)")
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.white)
            .shadow(radius: 2)

      }
      .background(Color("background4"))
      .cornerRadius(10)
      .frame(width: 80, height: 100)
      .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
   }
}
