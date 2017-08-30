//
//  ThisWeekTableViewCell.swift
//  amsl_mobile_rough_v1
//
//  Interface labels for tableview cells in the This Week's Events section
//
//  Created by Matthew Myers on 7/25/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventDateTimeLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
