//
//  Event.swift
//  amsl_mobile_rough_v1
//
//  Data model for events
//
//  Created by Matthew Myers on 8/4/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit
import os.log

class Event {
    
    //MARK: Properties
    
    var title: String
    var day: String
    var date: String
    var startTime: String
    var endTime: String
    var location: String
    var description: String
    var link: String?
    
    //MARK: Types
    
    struct PropertyKey {
        static let title = "title"
        static let day = "day"
        static let date = "date"
        static let startTime = "startTime"
        static let endTime = "endTime"
        static let location = "location"
        static let description = "description"
        static let link = "link"
    }
    
    //MARK: Initialization
    
    init?(title: String, day: String, date: String, startTime: String, endTime: String, location: String, description: String, link: String?) {
        
        // Initialize stored properties.
        self.title = title
        self.day = day
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
        self.location = location
        self.description = description
        self.link = link
    }
    
}
