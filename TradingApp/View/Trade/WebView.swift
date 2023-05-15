//
//  WebView.swift
//  TradingApp
//
//  Created by Artem Vorobev on 15.05.2023.
//

import SwiftUI
import WebKit
 
struct WebView: UIViewRepresentable {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
            let configuration = WKWebViewConfiguration()
            configuration.allowsInlineMediaPlayback = true
            
            let webView = WKWebView(frame: .zero, configuration: configuration)
            return webView
        }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}


