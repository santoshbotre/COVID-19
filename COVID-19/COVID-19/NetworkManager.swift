//
//  NetworkManager.swift
//  COVID-19
//
//  Created by Santosh Botre on 26/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
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
