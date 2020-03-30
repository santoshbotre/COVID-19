//
//  CountryListView.swift
//  COVID-19
//
//  Created by Santosh Botre on 28/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI

struct CountryListView: View {
    @ObservedObject var requester = AllCountriesStatusRequester()
    
    @State private var search: String = ""
    var localSearch: [Country] = Array()
    
    var body: some View {
        NavigationView {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, CGFloat(10.0))
                TextField("Search", text: $search, onEditingChanged: { active in
                    print("Editing changed: \(active)")
                }, onCommit: {
                    print("Commited: \(self.search)")
                })
                    .padding(.vertical, CGFloat(4.0))
                    .padding(.trailing, CGFloat(10.0))
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(Color.secondary, lineWidth: 1.0)
                )
                .padding()
                
                 List {
                    ForEach(requester.countries.filter {
                        self.search.isEmpty ? true : ($0.country?.contains(self.search))!
                    }, id: \.country) { country in
                        NavigationLink(destination: StatusDetailView(country: country)) {
                            CountryRowView(country: country)
                        }
                    }
                 }
             .navigationBarTitle(Text("COVID-19"))
            }
        }
    }
}

//struct CountryListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryListView()
//    }
//}
