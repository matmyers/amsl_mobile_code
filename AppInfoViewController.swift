//
//  AppInfoViewController.swift
//  amsl_mobile_rough_v1
//
//  View controller for App Info (credits) section
//
//  Created by Matthew Myers on 8/15/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit

class AppInfoViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var versionNum: UILabel!
    @IBOutlet weak var contactInfo: UILabel!
    @IBOutlet weak var credits: UILabel!
    @IBOutlet weak var originalDesignCredits: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        versionNum.text = "Version 1.0"
        contactInfo.text = "If you have any questions or concerns about this app, please contact Matthew Myers at matmyers@umich.edu"
        credits.text = "Credits: \n \n Icon made by http://www.freepik.com from https://www.flaticon.com/ \n \n Multiple icons made by https://www.flaticon.com/authors/madebyoliver from https://www.flaticon.com/ \n \n Icon made by https://www.flaticon.com/authors/google from https://www.flaticon.com/"
        originalDesignCredits.text = "Original app design by Matthew Myers, Ave Maria School of Law"
    }
    
    func creditFunc() {
        let credit1 = "Icon made by http://www.freepik.com from https://www.flaticon.com/"
        let link1 = "https://www.flaticon.com/free-icon/open-book-top-view_43212#term=academic&page=1&position=1"
        
        let credit2 = "Icon made by https://www.flaticon.com/authors/madebyoliver from https://www.flaticon.com/"
        let link2 = "https://www.flaticon.com/free-icon/calendar_149363#term=calendar&page=1&position=1"
        
        let credit3 = "same as credit2"
        let link3 = "https://www.flaticon.com/free-icon/user_149452"

        let credit4 = "same as credit2"
        let link4 = "https://www.flaticon.com/free-icon/internet_149229#term=internet&page=1&position=1"
        
        let credit5 = "same as credit2"
        let link5 = "https://www.flaticon.com/free-icon/info_149150#term=information&page=1&position=2"
        
        let credit6 = "Icon made by https://www.flaticon.com/authors/google from https://www.flaticon.com/"
        let link6 = "https://www.flaticon.com/free-icon/keyboard-right-arrow-button_60758#term=arrow&page=1&position=42"

        print(credit1)
        print(link1)
        print(credit2)
        print(link2)
        print(credit3)
        print(link3)
        print(credit4)
        print(link4)
        print(credit5)
        print(link5)
        print(credit6)
        print(link6)
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
