//
//  EventViewController.swift
//  amsl_mobile_rough_v1
//
//  View controller for each individual event
//
//  Created by Matthew Myers on 8/4/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UINavigationControllerDelegate {

    //current controller outputs
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var daydateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationHeaderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionHeaderLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var linkHeaderLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    //data from previous controller
    var titleString: String!
    var dayString: String!
    var dateString: String!
    var stString: String!
    var etString: String!
    var locationString: String!
    var descriptionString: String!
    var linkString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.checkVars()
        
        self.updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // test function
    func checkVars() {
        if let v1 = titleString {
            print(v1)
        }
        if let v2 = dayString {
            print(v2)
        }
        if let v3 = dateString {
            print(v3)
        }
        if let v4 = stString {
            print(v4)
        }
        if let v5 = etString {
            print(v5)
        }
        if let v6 = locationString {
            print(v6)
        }
        if let v7 = descriptionString {
            print(v7)
        }
        if let v8 = linkString {
            print(v8)
        }
    }
    
    func updateUI() {
        if let finalTitle = titleString {
            self.titleLabel.text = finalTitle
        }
        if let finalDay = dayString, let finalDate = dateString {
            self.daydateLabel.text = finalDay + " | " + customDateFormatter(date: finalDate)
        }
        if let finalStart = stString, let finalEnd = etString {
            self.timeLabel.text = finalStart + " - " + finalEnd
        }
        if let finalLoc = locationString {
            self.locationLabel.text = finalLoc
        }
        if let finalDesc = descriptionString {
            self.descriptionLabel.text = finalDesc
        }
        //self.titleLabel.text = titleString
        //self.daydateLabel.text = dayString + " | " + customDateFormatter(date: dateString)
        //self.timeLabel.text = stString + " - " + etString
        self.locationHeaderLabel.text = "Location"
        //self.locationLabel.text = locationString
        self.descriptionHeaderLabel.text = "Description"
        //self.descriptionLabel.text = descriptionString
        if let finalLink = linkString {
            if finalLink == "" {
                self.linkHeaderLabel.text = ""
                self.linkLabel.text = ""
            } else {
                self.linkHeaderLabel.text = "Link"
                self.linkLabel.text = finalLink
            }
        } else {
            self.linkHeaderLabel.text = ""
            self.linkLabel.text = ""
        }
    }
    
    // function that formats the date to read more easily
    func customDateFormatter(date: String) -> String {
        var finalDate = ""
        
        let index1 = date.index(date.startIndex, offsetBy: 2)
        let month = date.substring(to: index1)
        
        switch (month)
        {
        case "01":
            finalDate += "January "
        case "02":
            finalDate += "February "
        case "03":
            finalDate += "March "
        case "04":
            finalDate += "April "
        case "05":
            finalDate += "May "
        case "06":
            finalDate += "June "
        case "07":
            finalDate += "July "
        case "08":
            finalDate += "August "
        case "09":
            finalDate += "September "
        case "10":
            finalDate += "October "
        case "11":
            finalDate += "November "
        case "12":
            finalDate += "December "
        default:
            print("Invalid date!")
        }
        
        let start = date.index(date.startIndex, offsetBy: 3)
        let end = date.index(date.endIndex, offsetBy: -5)
        let range = start..<end
        
        let day = date.substring(with: range)
        
        let index2 = day.index(day.startIndex, offsetBy: 1)
        let firstDigit = day.substring(to: index2)
        //let index3 = day.index(day.startIndex, offsetBy: 1)
        let secondDigit = day.substring(from: index2)
        
        if firstDigit == "0" {
            finalDate += secondDigit
        } else {
            finalDate += day
        }
        
        let index3 = date.index(date.startIndex, offsetBy: 6)
        let year = date.substring(from: index3)
        
        finalDate += ", " + year
        
        return finalDate
    }

}
