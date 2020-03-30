//
//  ViewLoader.swift
//  COVID-19
//
//  Created by Santosh Botre on 26/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI

public class ViewLoader: ObservableObject {

    @Published var data = Data()
    let url:String
    
    public init(url:String){
        self.url = url
    }
    
    public func loadData() {
        guard let url = URL(string:url) else {
            return
        }

        URLSession.shared.dataTask(with: url){(data,_,_) in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
    
    public func getData() -> Data {
        return data
    }
    
    public func getUrl() -> String {
        return url
    }
}
