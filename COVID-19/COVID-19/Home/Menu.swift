//
//  Menu.swift
//  COVID-19
//
//  Created by Santosh Botre on 28/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI

struct MenuButton: View {
   @Binding var show: Bool

   var body: some View {
      return ZStack(alignment: .topLeading) {
         Button(action: { self.show.toggle() }) {
            HStack {
               Spacer()
               Image(systemName: "person")
                  .foregroundColor(.primary)
            }
            .padding(.trailing, 18)
            .frame(width: 90, height: 60)
            .background(Color("button"))
            .cornerRadius(30)
            .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
         }
         Spacer()
      }
   }
}


struct MenuRow: View {

   var image = "creditcard"
   var text = "My Account"

   var body: some View {
      return HStack {
         Image(systemName: image)
            .imageScale(.large)
            .foregroundColor(Color("icons"))
            .frame(width: 32, height: 32)

         Text(text)
            .font(.headline)
            .foregroundColor(.primary)

         Spacer()
      }
   }
}

struct Menu: Identifiable {
   var id = UUID()
   var title: String
   var icon: String
}

let menuData = [
   Menu(title: "About COVID-19", icon: "heart.fill"),
   Menu(title: "What You Can Do", icon: "person.crop.circle"),
   Menu(title: "Prevent and Management", icon: "gear"),
   Menu(title: "Credits", icon: "creditcard"), //"person.crop.circle"),
]

struct MenuView: View {

   var menu = menuData
   @Binding var show: Bool
   @State var showPreventAndManagement = false
   @State var showAbout = false
   @State var showWhatYouCanDo = false
   @State var showCredit = false
    
   var body: some View {
      return HStack {
         VStack(alignment: .leading) {
            ForEach(menu) { item in
                
                if item.title == "About COVID-19" {
                   Button(action: { self.showAbout.toggle() }) {
                    self.Print(item.title)
                      MenuRow(image: item.icon, text: item.title)
                        .sheet(isPresented: self.$showAbout) { AboutCovidView() }
                   }
                }
                else if item.title == "What You Can Do" {
                   Button(action: { self.showWhatYouCanDo.toggle()}) {
                      MenuRow(image: item.icon, text: item.title)
                         .sheet(isPresented: self.$showWhatYouCanDo) { WhatYouCanDoView() }
                   }
                }
                else if item.title == "Prevent and Management" {
                   Button(action: { self.showPreventAndManagement.toggle() }) {
                      MenuRow(image: item.icon, text: item.title)
                         .sheet(isPresented: self.$showPreventAndManagement) { PreventandManagementView() }
                   }
                }
               else if item.title == "Credits" {
                  Button(action: { self.showCredit.toggle()}) {
                     MenuRow(image: item.icon, text: item.title)
                        .sheet(isPresented: self.$showCredit) { HelpView() }
                  }
               } else {
                  MenuRow(image: item.icon, text: item.title)
               }
            }
            
            Spacer()
            Text("Copyright © 2020 Santosh Botre")
                .font(.caption)
                .foregroundColor(Color.blue)
            
            
         }
         .padding(.top, 20)
         .padding(30)
         .frame(minWidth: 0, maxWidth: 360)
         .background(Color("button"))
         .cornerRadius(30)
         .padding(.trailing, 60)
         .shadow(radius: 20)
         .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
         .animation(.default)
         .offset(x: show ? 0 : -UIScreen.main.bounds.width)
         .onTapGesture {
            self.show.toggle()
         }
         Spacer()
    
      }
      .padding(.top, statusBarHeight)
   }
}

struct CircleButton: View {

   var icon = "person.crop.circle"

   var body: some View {
      return HStack {
         Image(systemName: icon)
            .foregroundColor(.primary)
      }
      .frame(width: 44, height: 44)
      .background(Color("button"))
      .cornerRadius(30)
      .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
   }
}

struct MenuRight: View {

   @Binding var show: Bool
   @State var showUpdate = false

   var body: some View {
      return ZStack(alignment: .topTrailing) {
         HStack {
//            Button(action: { self.show.toggle() }) {
//               CircleButton(icon: "person.crop.circle")
//            }
            Button(action: { self.showUpdate.toggle() }) {
               CircleButton(icon: "list.dash")
                  .sheet(isPresented: self.$showUpdate) { CountryListView() }
            }
         }
         Spacer()
      }
   }
}

//struct MenuView_Previews: PreviewProvider {
//    var menu = menuData
//    @Binding var show: Bool = true
//    @State var showSettings = false
//    static var previews: some View {
//        MenuView(show: self.$show)
//    }
//}
