//
//  Details.swift
//  COVID-19
//
//  Created by Santosh Botre on 26/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI

struct Details: View {
    var country: Country
    var body: some View {
        VStack(alignment: .leading) {
            MapView(coordinate: country.countryInfo!.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            GeometryReader { geometry in
                AsyncImage(url: URL(string: self.country.countryInfo?.flag ?? "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!, placeholder: Text(""))
            .clipShape(Circle())
            .offset(x: geometry.size.width/5, y: -80)
            }
            
            VStack(alignment: .leading) {
                Text(country.country!)
                    .font(.title)

                HStack(alignment: .center) {
                    Image(systemName: "bolt.fill")
                    .foregroundColor(.blue)
                    Text("Total Cases \(country.cases!)")
                        .font(.subheadline)
                    Spacer()
                    Image(systemName: "timer")
                    .foregroundColor(.blue)
                     Text("Todays Cases \(country.todayCases!)")
                        .font(.subheadline)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Image(systemName: "umbrella.fill")
                    .foregroundColor(.green)
                    Text("Recovered \(country.recovered!)")
                        .font(.subheadline)
                    Spacer()
                    Image(systemName: "flame.fill")
                    .foregroundColor(.green)
                    Text("Active \(country.active!)")
                        .font(.subheadline)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    Text("Total Deaths \(country.deaths!)")
                        .font(.subheadline)
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                      .foregroundColor(.red)
                    Text("Todays Deaths \(country.todayDeaths!)")
                        .font(.subheadline)
                }
            }
            .padding()

        }
            
       .navigationBarTitle(Text(country.country!), displayMode: .inline)
    }
}
