//
//  CatTableViewCell.swift
//  assignment_1
//
//  Created by luhanfeng on 2019/9/15.
//  Copyright © 2019 luhanfeng. All rights reserved.
//

import UIKit

class CatTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    

    @IBOutlet weak var catImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
