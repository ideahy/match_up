//
//  UIView-Extension.swift
//  MatchUp
//
//  Created by 山本英明 on 2021/04/24.
//

import UIKit

extension UIView {
    
    //配置の設定(上下左右,X軸中心,Y軸中心,縦横幅)から必要なものだけ呼び出せるようにする
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        botton: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        centerY: NSLayoutYAxisAnchor? = nil,
        centerX: NSLayoutXAxisAnchor? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        topPadding: CGFloat = 0,
        bottomPadding: CGFloat = 0,
        leftPadding: CGFloat = 0,
        rightPadding: CGFloat = 0) {
        
        //自動的に下記処理を実行
        self.translatesAutoresizingMaskIntoConstraints = false
        
        //topの値を引数として受けた場合
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        if let botton = botton {
            self.bottomAnchor.constraint(equalTo: botton, constant: -bottomPadding).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
        }
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
