//
//  CardView.swift
//  iOSApp
//
//  Created by Chintan Vaghela on May/23/2019.
//  Copyright © 2019 Jing Li. All rights reserved.
//

import UIKit
import Foundation

class CardView: UIView {
    
    let SHADOW_GREY: CGFloat = 12.0 / 225.0
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(displayP3Red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.cornerRadius = 15.0
    }
}
