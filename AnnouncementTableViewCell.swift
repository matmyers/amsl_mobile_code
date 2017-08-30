//
//  AnnouncementTableViewCell.swift
//  amsl_mobile_rough_v1
//
//  Interface labels for tableview cells in the Announcements section
//
//  Created by Matthew Myers on 8/18/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit

class AnnouncementTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var announcementTitleLabel: UILabel!
    @IBOutlet weak var announcementDayDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
