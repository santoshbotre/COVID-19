//
//  HelpView.swift
//  COVID-19
//
//  Created by Santosh Botre on 29/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Credits")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 40)
            
            Text("\u{2022} API for Current cases and more stuff about COVID-19 or the Novel Coronavirus Strain")
                .font(.title)
            
            Text("https://github.com/novelcovid/api")
                .foregroundColor(Color.blue)
            .underline()
            .onTapGesture {
                UIApplication.shared.open(URL(string: "https://github.com/novelcovid/api")!)
            }
            .padding()
                        
            Text("\u{2022} World Health Organization")
                .font(.title)
            
            Text("https://www.who.int")
                .foregroundColor(Color.blue)
            .underline()
            .onTapGesture {
                UIApplication.shared.open(URL(string: "https://www.who.int/")!)
            }
             .padding()
            
            Text("\u{2022} Apple COVID-19 Screening Tool")
                .font(.title)
            
            Text("https://www.apple.com/covid19/")
                .foregroundColor(Color.blue)
            .underline()
            .onTapGesture {
                UIApplication.shared.open(URL(string: "https://www.apple.com/covid19/")!)
            }
            .padding()
            
            Spacer()
            
        } .padding()
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
