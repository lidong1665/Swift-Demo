//
//  WinXinTableViewCell.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/20.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit

class WinXinTableViewCell: UITableViewCell {

    @IBOutlet weak var lb_source: UILabel!
    @IBOutlet weak var lb_message: UILabel!
    @IBOutlet weak var img_icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
            }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
