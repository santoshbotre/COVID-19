//
//  Country.swift
//  COVID-19
//
//  Created by Santosh Botre on 26/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

// MARK: - Country
struct Country: Codable {
    let country: String?
    let countryInfo: CountryInfo?
    let cases, todayCases, deaths, todayDeaths: Int?
    let recovered, active, critical: Int?
    let casesPerOneMillion: Float?
    let deathsPerOneMillion: Float?
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

//extension Country {
//    var image: UIImage {
//        print("here i am")
//        let v = ViewLoader(url: countryInfo?.flag ?? "https://dummyimage.com/300")
//        print("downloading")
//        return UIImage(data: v.getData())!
//    }
//}
