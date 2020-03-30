//
//  WorldWideStatusRequester.swift
//  COVID-19
//
//  Created by Santosh Botre on 27/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import Foundation

struct WorldWideCoronaStatus: Codable {
    let cases, deaths, recovered: Int
    let updated: Double
    var today: String?
}

class WorldWideRequester: ObservableObject {
    @Published var worldWideCoronaStatus: WorldWideCoronaStatus?
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://corona.lmao.ninja/all")!
    
        URLSession.shared.dataTask(with: url) {[weak self] (data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode(WorldWideCoronaStatus.self, from: d)
                    DispatchQueue.main.async {
                        self?.worldWideCoronaStatus = decodedLists

                        if let timeResult = self?.worldWideCoronaStatus?.updated {
                            print(self?.worldWideCoronaStatus?.updated as Any)
                            self?.worldWideCoronaStatus?.today = createDateTime(timestamp: String(timeResult))
                            print(self?.worldWideCoronaStatus?.today as Any)
                        }
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

func createDateTime(timestamp: String) -> String {
    var strDate = "undefined"
        
    if let unixTime = Double(timestamp) {
        dump(unixTime)
        let date = Date(timeIntervalSince1970: unixTime)
        dump(date)
        
        let dateFormatter = DateFormatter()
        let timezone = TimeZone.current.abbreviation() ?? "IST"  // get current TimeZone abbreviation or set to CET
        dateFormatter.timeZone = TimeZone(abbreviation: timezone) //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd.MM.YYYY HH:mm" //Specify your format that you want
        strDate = dateFormatter.string(from: date)
    }
    return strDate
}
