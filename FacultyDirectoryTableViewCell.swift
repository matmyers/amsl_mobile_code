//
//  FacultyDirectoryTableViewCell.swift
//  amsl_mobile_rough_v1
//
//  Interface labels for tableview cells in the Faculty Directory
//
//  Created by Matthew Myers on 8/14/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit

class FacultyDirectoryTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personJob: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
