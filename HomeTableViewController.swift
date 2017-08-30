//
//  ViewController.swift
//  amsl_mobile_rough_v1
//
//  View controller for the home screen.
//
//  Created by Matthew Myers on 7/20/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // sets logo image in navbar
        let logo = UIImage(named: "logo4")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

