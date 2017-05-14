//
//  FeedCell.swift
//  instagramDemo
//
//  Created by hongjian lin on 5/13/17.
//  Copyright © 2017 com.hongjian. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    @IBOutlet var headerImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var bodyImage: UIImageView!
    @IBOutlet var descriptionField: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        descriptionField.isExclusiveTouch = true
    }

}
