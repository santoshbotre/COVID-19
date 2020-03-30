//
//  WhatYouCanDoView.swift
//  COVID-19
//
//  Created by Santosh Botre on 30/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI

struct WhatYouCanDoView: View {
    var body: some View {
        VStack {
        VStack(alignment: .leading) {
            Text("What You Can Do")
                .font(.largeTitle)
                .bold()
            Text("Information about social distancing, isolating from others, and more.")
                .font(.subheadline)
        }.padding(.all)
        
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image("washing")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .padding(.leading)
                    Text("Washing Your Hands")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                
                Text("Washing your hands is the best way to help you stay healthy. Here’s how to do it.")
                .padding()
                
                    Text("\u{2022} Wet your hands with clean, running water. Turn off the tap and apply soap.")
                    .padding()
                
                    Text("\u{2022} Lather your hands by rubbing them together. Get the backs of your hands, between your fingers, and under your nails.")
                    .padding()
                
                    Text("\u{2022} Scrub your hands for 20 seconds. Sing “Happy Birthday” twice while washing to gauge your timing.")
                    .padding()
                
                    Text("\u{2022} Rinse your hands under clean, running water. Air dry or use a clean towel.")
                    .padding()
                
                    Text("\u{2022} No soap or water? Use hand sanitizer that contains at least 60 percent alcohol. Apply the gel to the palm of one hand. Rub your hands together over all of your hands’ surfaces and fingers until your hands are dry.")
                    .padding()
                
                    Text("\u{2022} Avoid touching your face and eyes.")
                    .padding()

            }
            Spacer()
        
            VStack(alignment: .leading) {
            HStack {
                Image("socialdistancing")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.leading)
                Text("Social Distancing")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            
            Text("The main way COVID-19 spreads is between people. Social distancing helps to stop the spread.")
            .padding()
            
                Text("\u{2022} Avoid physical contact with other people.")
                .padding()
            
                Text("\u{2022} Stay at least 6 feet away from people when outside your home.")
                .padding()
            
                Text("\u{2022} Do not invite guests over to your house.")
                .padding()
                
                Text("\u{2022} Avoid large groups.")
                .padding()
                
                Text("\u{2022} Stay home if you’re sick.")
                .padding()

            }
            Spacer()
            
            VStack(alignment: .leading) {
            HStack {
                Image("isolate")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.leading)
                Text("Isolate Yourself from Others")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }

            Text("If you have confirmed or possible COVID-19 or have symptoms, isolate yourself in your home to protect others.")
            .padding()

            Text("\u{2022} Stay home. Monitor your symptoms and if they get worse, contact your doctor immediately.")
            .padding()

            Text("\u{2022} Do your best to stay away from your other household members, including pets. Designate a room for your use only. Ideally use your own bathroom, too.")
            .padding()

            Text("\u{2022} Have a household member or friend run errands for you like picking up groceries or prescriptions.")
            .padding()

            Text("\u{2022} Wear a mask if you have to be around other people. If you can’t find a mask, create one from a garment like a scarf. If you can’t wear a mask because of difficulty breathing, make sure caregivers wear one around you.")
            .padding()

            Text("\u{2022} You can leave your house to receive medical care, but don’t take the bus, subway, or taxi.")
            .padding()

            }
            Spacer()
                

            VStack(alignment: .leading) {
            HStack {
                Image("doctor")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                    .padding(.leading)
                Text("When should I see a doctor?")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }

            Text("Knowing when to see a doctor can keep medical care available for those who need it most.")
            .padding()

                Text("\u{2022} Most mild symptoms can be treated at home. The most up-to-date way to assess your best next steps is to complete Apple Screening Tool.")
                .padding()

                Text("\u{2022} If you have mild symptoms, call your doctor before going into their office. Many physicians’ offices are doing virtual visits. They will tell you what to do based on your location.")
                .padding()

                Text("\u{2022} Testing is limited-availability across the country and is currently being prioritized for healthcare workers, emergency medical service providers, police, and other essential workers, so please consult your doctor for availability in your local area.")
                .padding()

                Text("\u{2022} If you develop emergency warning signs, call 911. Main emergency warning signs include: persistent chest pain or pressure; extreme difficulty breathing; severe, constant dizziness or lightheadedness; slurred speech; and difficulty waking up.")
                .padding()
            }
            Spacer()

            
//            VStack(alignment: .leading) {
//            HStack {
//                Image("doctor")
//                    .resizable()
//                    .frame(width: 20, height: 20, alignment: .center)
//                    .padding(.leading)
//                Text("Symptom Monitoring")
//                    .font(.largeTitle)
//                    .bold()
//                Spacer()
//            }
//            }
//
//            Text("Observe your COVID-19 symptoms for 14 days if you suspect you have the disease, have been around someone who has tested positive for it, or you’ve been diagnosed.")
//            .padding()
//
//                Text("\u{2022} First, seek emergency care right away if you develop emergency warning signs, which include: persistent chest pain or pressure; extreme difficulty breathing; severe, constant dizziness or lightheadedness; slurred speech; and difficulty waking up.")
//                .padding()
//
//                Text("\u{2022} Have your medical provider’s contact information on hand.")
//                .padding()
//
//                Text("\u{2022} Keep a log of your symptoms, including your temperature.")
//                .padding()
//
//                Text("\u{2022} If your symptoms worsen, call your doctor immediately to update them and they will tell you what to do next. Complete Apple Screening Tool to help you determine next steps based on your symptoms and risk factors.")
//                .padding()
//            }
//            Spacer()
                       
            VStack(alignment: .leading) {
            HStack {
                Image("clean")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                    .padding(.leading)
                Text("Cleaning and Disinfecting Surfaces")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }

            Text("Commonly used surfaces should be regularly cleaned and disinfected.")
            .padding()

                Text("\u{2022} It’s always a good idea to routinely clean and disinfect frequently touched surfaces like tables, doorknobs, light switches, handles, desks, toilets, faucets, and sinks. But if you have a suspected or confirmed case of COVID-19, be vigilant about doing this daily.")
                .padding()

                Text("\u{2022} First, clean dirty surfaces with soap and water. Cleaning will remove dirt and lower the number of germs—but it will not kill germs.")
                .padding()

                Text("\u{2022} Next, disinfect surfaces to kill germs. Disinfecting after cleaning can further lower the risk of spreading an infection. Most common EPA-registered household disinfectants will work. Or dilute your household bleach with 1/3 cup of bleach per gallon of water.")
                .padding()

                Text("\u{2022} Wear dedicated gloves for COVID-19 related cleaning and disinfecting or use disposable gloves and discard them after each use.")
                .padding()
            }
            Spacer()
            
            }
        }
    }
}

struct WhatYouCanDoView_Previews: PreviewProvider {
    static var previews: some View {
        WhatYouCanDoView()
    }
}
