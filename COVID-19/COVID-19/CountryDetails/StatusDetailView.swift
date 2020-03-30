//
//  StatusDetailView.swift
//  COVID-19
//
//  Created by Santosh Botre on 28/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI

struct StatusDetailView: View {
    @State var selection: Int? = nil
    var country: Country
    var body: some View {
        
        GeometryReader { geometry in
        VStack(alignment: .leading) {
          
            MapView(coordinate: self.country.countryInfo!.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                    .frame(height: geometry.size.height / 3)
        
            GeometryReader { geometry in
                AsyncImage(url: URL(string: self.country.countryInfo?.flag ?? "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!, placeholder: Text(""))
            .clipShape(Circle())
            .offset(x: 0, y: -80)
            }
            
            VStack {
                if(self.country.country == "India") {
                NavigationLink(destination: StatewiseDetailView(), tag: 1, selection: self.$selection) {
                     Button("State Wise Details") {
                         self.selection = 1
                     }
                 }
                }
            VStack(alignment: .leading) {
                
                Text(self.country.country!)
                    .font(.title)

                HStack(alignment: .center) {
                    Image(systemName: "bolt.fill")
                    .foregroundColor(.blue)
                    Text("Total Cases \(self.country.cases!)")
                        .font(.subheadline)
                    Spacer()
                    Image(systemName: "timer")
                    .foregroundColor(.blue)
                    Text("Todays Cases \(self.country.todayCases!)")
                        .font(.subheadline)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Image(systemName: "umbrella.fill")
                    .foregroundColor(.green)
                    Text("Recovered \(self.country.recovered!)")
                        .font(.subheadline)
                    Spacer()
                    Image(systemName: "flame.fill")
                    .foregroundColor(.green)
                    Text("Active \(self.country.active!)")
                        .font(.subheadline)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    Text("Total Deaths \(self.country.deaths!)")
                        .font(.subheadline)
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                      .foregroundColor(.red)
                    Text("Todays Deaths \(self.country.todayDeaths!)")
                        .font(.subheadline)
                }
            }
            .padding()
            }
            .offset(y: -80)
            Spacer()
        }
            
        .navigationBarTitle(Text(self.country.country!), displayMode: .inline)
    }
    }
}


