//
//  ExpandableViewCellTableViewCell.swift
//  StoryboardTesting
//
//  Created by cyno on 26/04/24.
//

import UIKit

class ExpandableViewCellTableViewCell: UITableViewCell {
    @IBOutlet weak var decLbl: UILabel!
    @IBOutlet weak var headerLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
