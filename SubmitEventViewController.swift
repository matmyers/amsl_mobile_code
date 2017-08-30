//
//  SubmitEventViewController.swift
//  amsl_mobile_rough_v1
//
//  View controller for the Submit An Event tab in the Events section. Code handles webview
//
//  Created by Matthew Myers on 8/22/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit
import WebKit

class SubmitEventViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://amsl.avemarialaw.edu/MobileAppEvent")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
