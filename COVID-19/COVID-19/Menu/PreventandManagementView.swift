//
//  PreventandManagementView.swift
//  COVID-19
//
//  Created by Santosh Botre on 29/03/20.
//  Copyright © 2020 Santosh Botre. All rights reserved.
//

import SwiftUI
import PDFKit

struct PreventandManagementView: View {
    var body: some View {
        VStack {
        Text("Prevent and Management")
            .font(.largeTitle)
            .padding(.all)

            PDFKitView(url: URL(string: "https://www.mohfw.gov.in/pdf/PreventionandManagementofCOVID19FLWEnglish.pdf"))
        }
    }
}

struct PreventandManagementView_Previews: PreviewProvider {
    static var previews: some View {
        PreventandManagementView()
    }
}

struct PDFKitView : UIViewRepresentable {

    var url: URL?

    func makeUIView(context: Context) -> UIView {
        let pdfView = PDFView()

        if let url = url {
            pdfView.document = PDFDocument(url: url)
        }

        return pdfView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Empty
    }

}
