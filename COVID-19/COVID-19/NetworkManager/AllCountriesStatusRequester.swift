//
//  AllCountriesStatusRequester.swift
//  COVID-19
//
//  Created by Santosh Botre on 27/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import Foundation

class AllCountriesStatusRequester: ObservableObject {
    @Published var countries = Countries()
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://corona.lmao.ninja/countries")!
    
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode(Countries.self, from: d)
                    DispatchQueue.main.async {
                        self.countries = decodedLists
                    }
                }else {
                    print("No Data")
                }
            } catch {
                print ("Error:  \(error)")
            }
        }.resume()
    }
}

import Foundation
import UIKit
import CoreLocation

// MARK: - Country
struct Country: Codable, Identifiable {
    var id = UUID()
    let country: String?
    let countryInfo: CountryInfo?
    let cases, todayCases, deaths, todayDeaths: Int?
    let recovered, active, critical: Int?
    let casesPerOneMillion: Float?
    let deathsPerOneMillion: Float?
    
    enum CodingKeys: String, CodingKey {
        case country
        case countryInfo
        case cases, todayCases, deaths, todayDeaths
        case recovered, active, critical
        case casesPerOneMillion
        case deathsPerOneMillion
    }
}

// MARK: - CountryInfo
struct CountryInfo: Codable {
    let iso2, iso3: String?
    let id: Int?
    let lat, long: Double?
    let flag: String?

    enum CodingKeys: String, CodingKey {
        case iso2, iso3
        case id = "_id"
        case lat, long, flag
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: lat!,
            longitude: long!)
    }

}

typealias Countries = [Country]
