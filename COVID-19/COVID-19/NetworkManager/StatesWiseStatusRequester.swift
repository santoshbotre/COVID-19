////
////  StatesWiseStatusRequester.swift
////  COVID-19
////
////  Created by Santosh Botre on 30/03/20.
////  Copyright © 2020 Santosh Botre. All rights reserved.
////
//
import SwiftUI

class StatesWiseStatusRequester: ObservableObject {

    @Published var states = AllStates()

    init(){
        load()
    }

    func load() {
        let url = URL(string: "https://api.covid19india.org/state_district_wise.json")!

        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
//                    let decodedLists = try JSONDecoder().decode([String: DistrictData].self, from: d)
//                    let decodedLists = try JSONDecoder().decode([String: Any].self, from: d)
                    DispatchQueue.main.async {
//                        dump(decodedLists)
                        //self.states = decodedLists
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


struct States: Decodable {
    var state: [String:[String:String]]?
}

typealias AllStates = [States]

struct DistrictData: Codable {
    var district: [String: Area]
}

struct Area: Codable {
    let confirmed: Int
    let lastupdatedtime: String
    let delta: Delta
}

// MARK: - Delta
struct Delta: Codable {
    let confirmed: Int
}


extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, from data: Data, keyedBy key: String?) throws -> T {
        if let key = key {
            // Pass the top level key to the decoder
            userInfo[.jsonDecoderRootKeyName] = key
            let root = try decode(DecodableRoot<T>.self, from: data)
            dump(root)
            return root.value
        } else {
            return try decode(type, from: data)
        }
    }
}
extension CodingUserInfoKey {
    static let jsonDecoderRootKeyName = CodingUserInfoKey(rawValue: "rootKeyName")!
}
struct DecodableRoot<T>: Decodable where T: Decodable {

    private struct CodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        init?(intValue: Int) {
            self.intValue = intValue
            stringValue = "\(intValue)"
        }
        static func key(named name: String) -> CodingKeys? {
            return CodingKeys(stringValue: name)
        }
    }
    let value: T
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        guard
          let keyName = decoder.userInfo[.jsonDecoderRootKeyName] as? String,
          let key = CodingKeys.key(named: keyName) else {
             throw DecodingError.valueNotFound(T.self, DecodingError.Context(codingPath: [], debugDescription: "Value not found at root level."))
        }

        value = try container.decode(T.self, forKey: key)
    }
}
