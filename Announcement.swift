//
//  Announcement.swift
//  amsl_mobile_rough_v1
//
//  Data model for announcements
//
//  Created by Matthew Myers on 8/18/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit
import os.log

class Announcement {
    
    //MARK: Properties
    
    var title: String
    var day: String
    var date: String
    var description: String
    
    //MARK: Types
    
    struct PropertyKey {
        static let title = "title"
        static let day = "day"
        static let date = "date"
        static let description = "description"
    }
    
    //MARK: Initialization
    
    init?(title: String, day: String, date: String, description: String) {
        
        // Initialize stored properties.
        self.title = title
        self.day = day
        self.date = date
        self.description = description
    }
    
}
