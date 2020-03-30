//
//  WorldWideRequester.swift
//  COVID-19
//
//  Created by Santosh Botre on 26/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import Foundation

class WorldWideRequester: ObservableObject {
    @Published var world: WorldWide?
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://corona.lmao.ninja/all")!
    
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode(WorldWide.self, from: d)
                    DispatchQueue.main.async {
                        self.world = decodedLists
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
