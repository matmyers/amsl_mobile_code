//
//  PersonViewController.swift
//  amsl_mobile_rough_v1
//
//  View controller for each individual person in a directory
//
//  Created by Matthew Myers on 8/6/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController, UINavigationControllerDelegate {

    //current controller outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var phoneHeaderLabel: UILabel!
    @IBOutlet weak var emailHeaderLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    @IBAction func callButton(_ sender: UIButton) {
        guard let number = URL(string: "tel://" + phoneString) else { return }
        UIApplication.shared.open(number)
    }
    
    @IBAction func emailButton(_ sender: UIButton) {
        if let address = URL(string: "mailto:\(emailString)") {
            UIApplication.shared.open(address)
        }
    }
    
    //data from previous controller
    var nameString: String!
    var jobString: String!
    var phoneString: String!
    var emailString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        if let finalName = nameString {
            self.nameLabel.text = finalName
        }
        if let finalJob = jobString {
            self.jobLabel.text = finalJob
        }
        
        self.emailHeaderLabel.text = "Email:"
        
        if let validPhone = phoneString {
            if validPhone == "" {
                self.phoneHeaderLabel.text = ""
                self.callButton.setTitle("", for: .normal)
            } else {
                self.phoneHeaderLabel.text = "Phone:"
                
                let index1 = validPhone.index(validPhone.startIndex, offsetBy: 3)
                let firstThree = validPhone.substring(to: index1)
                let index2 = validPhone.index(validPhone.startIndex, offsetBy: 6)
                let range = index1..<index2
                let secondThree = validPhone.substring(with: range)
                let lastFour = validPhone.substring(from: index2)
                let finalPhoneString = firstThree + "-" + secondThree + "-" + lastFour
                
                self.callButton.setTitle(finalPhoneString, for: .normal)
            }
        } else {
            self.phoneHeaderLabel.text = ""
            self.callButton.setTitle("", for: .normal)
        }
        
        if let validEmail = emailString {
            self.emailButton.setTitle(validEmail, for: .normal)
        }
    }

}
