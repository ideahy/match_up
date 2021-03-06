//
//  UIColor-Extension.swift
//  MatchUp
//
//  Created by 山本英明 on 2021/04/26.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return .init(red: red / 255, green:  green / 255, blue:  blue / 255, alpha: 1)
    }
    
}
