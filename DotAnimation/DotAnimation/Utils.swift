//
//  Utils.swift
//  DotAnimation
//
//  Created by Anh Nguyen on 7/29/19.
//  Copyright © 2019 Anh Nguyen. All rights reserved.
//

import Foundation
import UIKit

func fontSizeScaled(_ value: CGFloat) -> CGFloat {
    let scaled = valueScaled(value)
    return scaled.rounded(.up)
}

func valueScaled(_ value: CGFloat) -> CGFloat {
    let designedWidthSize: CGFloat = 414
    let multiplier = UIScreen.main.bounds.width / designedWidthSize
    let scaled = value * multiplier
    
    return scaled.rounded()
}
