//
//  AnnouncementTableViewController.swift
//  amsl_mobile_rough_v1
//
//  View Controller for list of Announcements
//
//  Created by Matthew Myers on 8/18/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit

class AnnouncementTableViewController: UITableViewController {

    // set url to where json data is read
    private final let urlString = "https://matmyers.github.io/amsl_mobile/mobileAppAnnouncements.json"
    
    // store announcements from json file in this array
    private var announcementArray = [Announcement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.downloadJsonWithURL()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // function that downloads and parses json data from github
    func downloadJsonWithURL() {
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //let today = Date()
                //let formatter = DateFormatter()
                //formatter.dateFormat = "MM/dd/yyyy"
                //let currentDateString = formatter.string(from: today)
                
                //let todayAbsDate = self.calcAbsoluteDate(currentDate: currentDateString)
                //let lastDay = todayAbsDate + 7
                
                if let announcements = jsonObj!.value(forKey: "announcements") as? NSArray {
                    
                    var announcementToBeEdited = Announcement(title: "", day: "", date: "", description: "")
                    
                    //var dateForThisEvent = 0
                    
                    for announcement in announcements{
                        
                        announcementToBeEdited = Announcement(title: "", day: "", date: "", description: "")
                        
                        if let announcementDict = announcement as? NSDictionary {
                            if let title = announcementDict.value(forKey: "title") {
                                announcementToBeEdited?.title = title as! String
                            }
                            if let day = announcementDict.value(forKey: "day") {
                                announcementToBeEdited?.day = day as! String
                            }
                            if let date = announcementDict.value(forKey: "date") {
                                announcementToBeEdited?.date = date as! String
                                //dateForThisEvent = self.calcAbsoluteDate(currentDate: (eventToBeEdited?.date)!)
                            }
                            if let description = announcementDict.value(forKey: "description") {
                                announcementToBeEdited?.description = description as! String
                            }
                            
                            
                            //if dateForThisEvent >= todayAbsDate && dateForThisEvent < lastDay {
                                //self.eventArray.append(eventToBeEdited!)
                            //}
                            
                            self.announcementArray.append(announcementToBeEdited!)
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    self.tableView.reloadData()
                })
            } else {
                print("nothing argh!")
            }
        }).resume()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcementArray.count
    }
    
    // populates tableview cells with data from json file
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnnouncementTableViewCell") as! AnnouncementTableViewCell
        
        cell.announcementTitleLabel.text = announcementArray[indexPath.row].title
        cell.announcementDayDateLabel.text = announcementArray[indexPath.row].day + " | " + customDateFormatter(date: announcementArray[indexPath.row].date)
        
        return cell
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
    
    func calcAbsoluteDate(currentDate: String) -> Int {
        
        var absDate = 0
        
        let index1 = currentDate.index(currentDate.startIndex, offsetBy: 2)
        let month = currentDate.substring(to: index1)
        
        switch (month)
        {
        case "01":
            absDate += 0
        case "02":
            absDate += 31
        case "03":
            absDate += 59
        case "04":
            absDate += 90
        case "05":
            absDate += 120
        case "06":
            absDate += 151
        case "07":
            absDate += 181
        case "08":
            absDate += 212
        case "09":
            absDate += 243
        case "10":
            absDate += 273
        case "11":
            absDate += 304
        case "12":
            absDate += 334
        default:
            print("Invalid date!")
        }
        
        let start = currentDate.index(currentDate.startIndex, offsetBy: 3)
        let end = currentDate.index(currentDate.endIndex, offsetBy: -5)
        let range = start..<end
        
        let day = currentDate.substring(with: range)
        
        let index2 = day.index(day.startIndex, offsetBy: 1)
        let firstDigit = day.substring(to: index2)
        let secondDigit = day.substring(from: index2)
        
        if firstDigit == "0" {
            absDate += Int(secondDigit)!
        } else {
            absDate += Int(day)!
        }
        
        let index3 = currentDate.index(currentDate.startIndex, offsetBy: 6)
        let year = currentDate.substring(from: index3)
        
        let totalDaysFromYear = 365 * Int(year)!
        
        absDate += totalDaysFromYear
        
        return absDate
    }
    
    // sets height of tableview cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70;
    }
    
    // passes data for announcement to AnnouncementViewController when user selects this cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AnnouncementViewController") as! AnnouncementViewController
        
        vc.titleString = announcementArray[indexPath.row].title
        vc.dayString = announcementArray[indexPath.row].day
        vc.dateString = announcementArray[indexPath.row].date
        vc.descriptionString = announcementArray[indexPath.row].description
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
