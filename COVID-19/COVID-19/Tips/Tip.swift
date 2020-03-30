//
//  Tip.swift
//  COVID-19
//
//  Created by Santosh Botre on 27/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import Foundation
import SwiftUI

struct Tips: Identifiable {
    let id = UUID()
    let index: Int?
    let title: String
    let image: String
    let color: Color
    let description: String
}

let tipsData = [
    Tips(index: 0, title: "Practice Social Distancing", image: "socialdistancing", color: Color("background3"), description: "Avoid gatherings, Maintain a safe distance, Stay at home, and Avoid touching surfaces."),
    Tips(index: 1, title: "Practice good hygiene", image: "goodhygiene", color: Color("background4"), description: "Wash your hands frequently using soap and water."),
    Tips(index: 2,title: "Do not touch face", image: "donttouchtheface", color: Color("background7"), description:"Do not touch eyes, mouth and nose."),
    Tips(index: 3, title: "Having symptoms or have travelled", image: "travel", color:Color("background8"), description: "The person should visit a health facility."),
    Tips(index: 4, title: "Keep the area clean",image: "clean", color: Color("background9"), description: "Keep cleaning the area we are leaving in.")
]
