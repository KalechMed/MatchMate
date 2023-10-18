//
//  GifView.swift
//  MatchMate
//
//  Created by Mohamed  on 7/10/2023.
//

import SwiftUI
import WebKit

struct GifManager: UIViewRepresentable {
    private let name: String
    init(_ name: String) {
           self.name = name
       }
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
               webView.isOpaque = false
               webView.backgroundColor = UIColor.clear
               let url = Bundle.main.url(forResource: name, withExtension: "gif")!
               let data = try! Data(contentsOf: url)
               webView.load(
                   data,
                   mimeType: "image/gif",
                   characterEncodingName: "UTF-8",
                   baseURL: url.deletingLastPathComponent()
               )
               webView.scrollView.isScrollEnabled = false

               return webView
           
       }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
            uiView.reload()
        }
}

#Preview {
    GifManager("Cat")
}
