//
//  ActivityIndicator.swift
//  COVID-19
//
//  Created by Santosh Botre on 26/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//


import SwiftUI

@available(iOS 13.0, *)
public struct ActivityIndicator: UIViewRepresentable {
    
    let style: UIActivityIndicatorView.Style
    
    public func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}
