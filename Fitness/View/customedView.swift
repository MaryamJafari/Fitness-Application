//
//  customedView.swift
//  Fitness
//
//  Created by Maryam Jafari on 10/7/17.
//  Copyright © 2017 Maryam Jafari. All rights reserved.
//

import UIKit

class customedView: UIView {
let SHADOW_GRAY : CGFloat = 157.0/225.0
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.9).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 3.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }

}
