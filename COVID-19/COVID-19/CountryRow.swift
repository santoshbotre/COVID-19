//
//  CountryRow.swift
//  COVID-19
//
//  Created by Santosh Botre on 26/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI
import UIKit
import CoreGraphics


enum Level: Int {
    case none = 0
    case weak = 1
    case ok = 2
    case strong = 3
}

struct CountryRow: View {
    
    var country: Country
    
    var body: some View {
        
         VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
            }
            // Upper Stackview - Contains Horizontal stack and post content
          HStack(spacing: 10) {
              // avatar
              AsyncImage(url: URL(string: country.countryInfo?.flag ?? "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!, placeholder: Text(""))
              .frame(maxWidth: 60, minHeight: 20, maxHeight: 60, alignment: .center)
              .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 3) {
                // name
                Text("\(country.country ?? "NA")").font(.headline)
                // Total Cases
               Text("Total Cases: \(country.cases!)" ).font(.subheadline)
                // Todays cases
                Text("Today Cases: \(country.todayCases!)" ).font(.subheadline)
            }
            .padding(.leading, 5)  // spacing from left edge of the view
            .padding(.trailing, 5) // spacing from right edge of the view
        }

            
        HStack(alignment: .top) {
            CardView(title: "Active Cases", count: country.active ?? 0, color: Color.blue)
            CardView(title: "Critical Cases",
                     count: country.critical ?? 0, color: Color.yellow,
                     shadowColor: Color("backgroundShadow3")
            )
            CardView(title: "Death Count",
                     count: country.deaths ?? 0, color: Color.red,
                     shadowColor: Color("backgroundShadow3")
            )
            CardView(title: "Recover Cases",
                     count: country.recovered ?? 0, color: Color.green,
                     shadowColor: Color("backgroundShadow3")
                )
            }
            
        }
         .frame(height: 180)
    }
}

func getColors(level: Level = .none) -> [Color] {
    switch level {
    case .none:
        return [.clear, .clear, .clear]
    case .weak:
        return [.red, .clear, .clear]
    case .ok:
        return [.red, .orange, .clear]
    case .strong:
        return [.red, .orange, .green]
    }
}
