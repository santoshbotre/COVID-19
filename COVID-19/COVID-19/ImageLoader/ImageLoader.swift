//
//  ImageLoader.swift
//  COVID-19
//
//  Created by Santosh Botre on 26/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import Foundation
import Combine
import UIKit

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private(set) var isLoading = false
    
    private let url: URL
    private var cache: ImageCache?
    private var cancellable: AnyCancellable?
    
    private static let imageProcessingQueue = DispatchQueue(label: "image-processing")
    
    init(url: URL, cache: ImageCache? = nil) {
        self.url = url
        self.cache = cache
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        guard !isLoading else { return }

        if let image = cache?[url] {
            self.image = image
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(receiveSubscription: { [weak self] _ in self?.onStart() },
                          receiveOutput: { [weak self] in self?.cache($0) },
                          receiveCompletion: { [weak self] _ in self?.onFinish() },
                          receiveCancel: { [weak self] in self?.onFinish() })
            .subscribe(on: Self.imageProcessingQueue)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
    private func onStart() {
        isLoading = true
    }
    
    private func onFinish() {
        isLoading = false
    }
    
    private func cache(_ image: UIImage?) {
        image.map { cache?[url] = $0 }
    }
}

/*
 //
 //  ContentView.swift
 //  COVID-19
 //
 //  Created by Santosh Botre on 25/03/20.
 //  Copyright © 2020 Santosh Botre. All rights reserved.
 //

 import SwiftUI

 struct ContentView: View {
     
     @ObservedObject var fetcher = NetworkManager()
     @State private var search: String = ""
     var localSearch: [Country] = Array()
     
     var body: some View {
         NavigationView {
             VStack(alignment: .center, spacing: 0) {
             HStack {
                 Image(systemName: "magnifyingglass")
                     .padding(.leading, CGFloat(10.0))
                 TextField("Search", text: $search, onEditingChanged: { active in
                     print("Editing changed: \(active)")
                 }, onCommit: {
                     print("Commited: \(self.search)")
                 })
                     .padding(.vertical, CGFloat(4.0))
                     .padding(.trailing, CGFloat(10.0))
                 }
                 .overlay(
                     RoundedRectangle(cornerRadius: 5.0)
                         .stroke(Color.secondary, lineWidth: 1.0)
                 )
                 .padding()
                 
                  List {
                     ForEach(fetcher.countries.filter {
                         self.search.isEmpty ? true : ($0.country?.contains(self.search))!
                     }, id: \.country) { country in
                          CountryRow(country: country)
                     }
                  }
              .navigationBarTitle(Text("COVID-19"))
             }
         }
     }
 }

 private func title(for value: String?) -> String {
     guard let value = value, value.count > 0 else {
         return "No search"
     }

     return #"Searching for "\#(value)""#
 }

 struct ContentView_Previews: PreviewProvider {
     
     static var previews: some View {
         ContentView()
     }
 }

 **/
