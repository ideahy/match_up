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
    
    //ボタン作成(*{}の中でUI作成)
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("tap", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.layer.shadowOffset = .init(width: 1.5, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 15
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //配色
        backgroundColor = .purple
        
        //インスタンス化 & 配色
        let view1 = UIView()
        view1.backgroundColor = .orange
        //ボタン追加
        view1.addSubview(button)
        
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
        
        //配置(AutoLayout) & constantは両端の余白
        [baseStackView.topAnchor.constraint(equalTo: topAnchor),
         baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
         baseStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
         baseStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
         //ボタンをview1のY軸中心に配置
         button.centerYAnchor.constraint(equalTo: view1.centerYAnchor),
         button.centerXAnchor.constraint(equalTo: view1.centerXAnchor),
         //幅と高さを指定
         button.widthAnchor.constraint(equalToConstant: 50),
         button.heightAnchor.constraint(equalToConstant: 50)
        ].forEach { $0.isActive = true }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
