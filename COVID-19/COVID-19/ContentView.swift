//
//  ContentView.swift
//  COVID-19
//
//  Created by Santosh Botre on 27/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI

let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
let screen = UIScreen.main.bounds

struct ContentView: View {
    @State var show = false
    @State var showProfile = false

    @ObservedObject var requester = StatesWiseStatusRequester()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(named: "accentShadow")
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView(.vertical) {
                    WorldWideStatusView()
                        .blur(radius: show ? 20 : 0)
                        .scaleEffect(showProfile ? 0.95 : 1)
                        .animation(.default)
                        .offset(x: 0, y: statusBarHeight + 110)
                        .padding(.bottom, 10)
                   
                    TipsView()
                        .offset(y: statusBarHeight + 40 )
                        .frame(height: 500)
                }
                
                HStack {
                    MenuButton(show: $show)
                        .offset(x: -40)
                        
                    Spacer()

                    MenuRight(show: $showProfile)
                        .offset(x: -2)
                }
                .offset(y: showProfile ? 0 : 85)
                .animation(.spring())
                
                MenuView(show: $show)
            }
            .background(Color("background"))
            .navigationBarTitle("COVID-19", displayMode: .inline)
            .edgesIgnoringSafeArea(.all)
        
        }
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        ModifiedContent(content: self, modifier: HiddenNavigationBar())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

