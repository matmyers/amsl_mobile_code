//
//  Person.swift
//  amsl_mobile_rough_v1
//
//  Data model for persons in the faculty/admin directories
//
//  Created by Matthew Myers on 8/6/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit
import os.log

class Person {
    
    //MARK: Properties
    
    var name: String
    var job: String
    var phoneNumber: String?
    var emailAddress: String
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let job = "job"
        static let phoneNumber = "phoneNumber"
        static let emailAddress = "emailAddress"
    }
    
    //MARK: Initialization
    
    init?(name: String, job: String, phoneNumber: String?, emailAddress: String) {
        
        // Initialize stored properties.
        self.name = name
        self.job = job
        self.phoneNumber = phoneNumber
        self.emailAddress = emailAddress
    }
    
}

