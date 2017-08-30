//
//  AnnouncementViewController.swift
//  amsl_mobile_rough_v1
//
//  View controller for each individual announcement
//
//  Created by Matthew Myers on 8/18/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit

class AnnouncementViewController: UIViewController, UINavigationControllerDelegate {

    //current controller outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var daydateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //data from previous controller
    var titleString: String!
    var dayString: String!
    var dateString: String!
    var descriptionString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // sets interface labels with data passed from tableview
    func updateUI() {
        if let finalTitle = titleString {
            self.titleLabel.text = finalTitle
        }
        if let finalDay = dayString, let finalDate = dateString {
            self.daydateLabel.text = "Announcement made: " + finalDay + ", " + customDateFormatter(date: finalDate)
        }
        if let finalDesc = descriptionString {
            self.descriptionLabel.text = finalDesc
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
