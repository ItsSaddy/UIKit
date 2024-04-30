//
//  ViewController.swift
//  UIKitLesson
//
//  Created by Boboev Saddam on 30/04/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    
    private let url = URL(string: "https://apple.com")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preference = WKWebpagePreferences()
        preference.allowsContentJavaScript = true
        
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preference
        
        if let url {
            webView.load(URLRequest(url: url))
        }
    }
}
