//
//  MenuCellTableViewCell.swift
//  ForestClone
//
//  Created by Christian Leovido on 18/06/2020.
//  Copyright © 2020 Christian Leovido. All rights reserved.
//

import UIKit

class MenuCellTableViewCell: UITableViewCell {

    static let identifier = "MenuCell"

    @IBOutlet weak var menuItemLabel: UILabel!
    @IBOutlet weak var menuItemImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
