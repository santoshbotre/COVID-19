//
//  AboutCovidView.swift
//  COVID-19
//
//  Created by Santosh Botre on 30/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI

struct AboutCovidView: View {
    var body: some View {
        VStack {
        VStack(alignment: .leading) {
            Text("About COVID-19")
                .font(.largeTitle)
                .bold()
            Text("An up-to-date rundown of the virus and its symptoms.")
                .font(.subheadline)
        }.padding(.all)
        
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image("virus")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .padding(.leading)
                    Text("What is COVID-19?")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                
                Text("COVID-19 is the new respiratory disease spreading around the world and it is caused by a coronavirus. COVID-19 is short for \"coronavirus disease 2019.\"")
                .padding()
                
                    Text("\u{2022} The virus is thought to spread mainly between people who are in close contact with one another (about 6 feet) and through respiratory droplets produced when an infected person coughs or sneezes.")
                    .padding()
                
                    Text("\u{2022} People are most contagious when they are the sickest. But those who don’t have a lot of symptoms can still pass the virus on to others.")
                    .padding()
                
                    Text("\u{2022} There is currently no vaccine or cure for COVID-19 but researchers are working to find one.")
                    .padding()

            }
            Spacer()
        
            VStack(alignment: .leading) {
            HStack {
                Image("symptoms")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.leading)
                Text("What are COVID-19’s symptoms?")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            
            Text("The most common symptoms are very similar to other viruses: fever, cough, and difficulty breathing.")
            .padding()
            
                Text("\u{2022} Common symptoms of COVID-19 are changing as more is learned about the disease. For the most up to date symptom list, visit the CDC’s website.")
                .padding()
            
                Text("\u{2022} Symptoms may appear 2 to 14 days after exposure and range from mild to severe illness.")
                .padding()
            
                Text("\u{2022} If you or someone you know has symptoms, our Screening Tool will recommend best next steps.")
                .padding()

            }
            Spacer()
            
            VStack(alignment: .leading) {
            HStack {
                Image("man")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.leading)
                Text("Who is at high risk for COVID-19?")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            
            Text("Everyone is at risk of getting COVID-19, but some people are at a higher risk of serious illness.")
            .padding()
            
                Text("\u{2022} Generally speaking, adults aged 65 and older and people of any age who have heart disease, lung disease, and diabetes with complications (such as, but not limited to, kidney disease, heart disease, and neuropathy) may be at higher risk for serious illness from COVID-19.")
                .padding()
            
                Text("\u{2022} The most up-to-date way to assess your risk is to complete Apple Screening Tool.")
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
            
            }
        }
    }
}

struct AboutCovid_Previews: PreviewProvider {
    static var previews: some View {
        AboutCovidView()
    }
}
