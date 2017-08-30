//
//  AmslPortal2ViewController.swift
//  amsl_mobile_rough_v1
//
//  Alternate view controller for the Portal section used for testing. Code handles webview
//
//  Created by Matthew Myers on 8/17/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit

class AmslPortal2ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var portalWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://portal.avemarialaw.edu/_layouts/MyLawLogin/APSLogin.aspx?ReturnUrl=%2f_layouts%2fAuthenticate.aspx%3fSource%3d%252F&Source=%2F")
        portalWebView.loadRequest(URLRequest(url: url!))
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
