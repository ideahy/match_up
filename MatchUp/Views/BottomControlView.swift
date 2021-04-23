//
//  BottomControlView.swift
//  MatchUp
//
//  Created by 山本英明 on 2021/04/23.
//

//
//  個別のビューを作成する
//

import UIKit

class BottomControlView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        //配色
        backgroundColor = .purple
        
        //インスタンス化 & 配色
        let view1 = UIView()
        view1.backgroundColor = .orange
        let view2 = UIView()
        view2.backgroundColor = .orange
        let view3 = UIView()
        view3.backgroundColor = .orange
        let view4 = UIView()
        view4.backgroundColor = .orange
        let view5 = UIView()
        view5.backgroundColor = .orange
        
        //UIStackViewを作成
        let baseStackView = UIStackView(arrangedSubviews: [view1,view2,view3,view4,view5])
        
        //横分割
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 10
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //対象ViewにstackViewを入れる
        addSubview(baseStackView)
        
        //配置(AutoLayout)
        [baseStackView.topAnchor.constraint(equalTo: topAnchor),
         baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
         baseStackView.leftAnchor.constraint(equalTo: leftAnchor),
         baseStackView.rightAnchor.constraint(equalTo: rightAnchor)
        ].forEach { $0.isActive = true }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
