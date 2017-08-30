//
//  ThisWeekTableViewController.swift
//  amsl_mobile_rough_v1
//
//  Created by Matthew Myers on 7/23/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit

class ThisWeekTableViewController: UITableViewController {
    
    // set url to where json data is read
    private final let urlString = "https://matmyers.github.io/amsl_mobile/mobileAppEvents.json"
    
    // store events from json file in this array
    private var eventArray = [Event]()
    
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

                // gets current date in order to display only events for the current week
                let today = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                let currentDateString = formatter.string(from: today)
                
                let todayAbsDate = self.calcAbsoluteDate(currentDate: currentDateString)
                //print(todayAbsDate)
                let lastDay = todayAbsDate + 7
                
                if let events = jsonObj!.value(forKey: "events") as? NSArray {
                    
                    var eventToBeEdited = Event(title: "", day: "", date: "", startTime: "", endTime: "", location: "", description: "", link: "")
                    
                    var dateForThisEvent = 0
                    
                    for event in events{
                        
                        eventToBeEdited = Event(title: "", day: "", date: "", startTime: "", endTime: "", location: "", description: "", link: "")
                        
                        if let eventDict = event as? NSDictionary {
                            if let title = eventDict.value(forKey: "title") {
                                eventToBeEdited?.title = title as! String
                            }
                            if let day = eventDict.value(forKey: "day") {
                                eventToBeEdited?.day = day as! String
                            }
                            if let date = eventDict.value(forKey: "date") {
                                eventToBeEdited?.date = date as! String
                                dateForThisEvent = self.calcAbsoluteDate(currentDate: (eventToBeEdited?.date)!)
                                //print(dateForThisEvent)
                            }
                            if let startTime = eventDict.value(forKey: "startTime") {
                                eventToBeEdited?.startTime = startTime as! String
                            }
                            if let endTime = eventDict.value(forKey: "endTime") {
                                eventToBeEdited?.endTime = endTime as! String
                            }
                            if let location = eventDict.value(forKey: "location") {
                                eventToBeEdited?.location = location as! String
                            }
                            if let description = eventDict.value(forKey: "description") {
                                eventToBeEdited?.description = description as! String
                            }
                            if let link = eventDict.value(forKey: "link") {
                                eventToBeEdited?.link = link as? String
                            }
                            
                            
                            if dateForThisEvent >= todayAbsDate && dateForThisEvent < lastDay {
                                //print("cool!")
                                self.eventArray.append(eventToBeEdited!)
                            }
                            
                            //self.eventArray.append(eventToBeEdited!)
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
        return eventArray.count
    }

    // populates tableview cells with data from json file
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell") as! EventTableViewCell
        
        cell.eventTitleLabel.text = eventArray[indexPath.row].title
        cell.eventDateTimeLabel.text = eventArray[indexPath.row].day + " | " + customDateFormatter(date: eventArray[indexPath.row].date)
        cell.eventLocationLabel.text = eventArray[indexPath.row].location
        
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
        //let index3 = day.index(day.startIndex, offsetBy: 1)
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
        return 80;
    }

    // passes data for announcement to EventViewController when user selects this cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EventViewController") as! EventViewController
        
        vc.titleString = eventArray[indexPath.row].title
        vc.dayString = eventArray[indexPath.row].day
        vc.dateString = eventArray[indexPath.row].date
        vc.stString = eventArray[indexPath.row].startTime
        vc.etString = eventArray[indexPath.row].endTime
        vc.locationString = eventArray[indexPath.row].location
        vc.descriptionString = eventArray[indexPath.row].description
        vc.linkString = eventArray[indexPath.row].link
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
