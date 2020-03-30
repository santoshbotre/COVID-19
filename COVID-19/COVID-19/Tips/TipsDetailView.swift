//
//  TipsDetailView.swift
//  COVID-19
//
//  Created by Santosh Botre on 28/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI

struct TipsDetailView: View {
    var tip: Tips
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            self.Print(tip.title)
            Image(tip.image)
            
            Text(tip.title)
                .font(.largeTitle)
            
            Text(tip.description)
                .font(.body)
        }
        .padding(.all, 20)
    }
}


//struct TipsDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TipsDetailView()
//    }
//}
