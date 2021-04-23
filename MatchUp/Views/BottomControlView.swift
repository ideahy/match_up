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
        let view1 = BottomButtonView()
        view1.backgroundColor = .orange
        
        let view2 = BottomButtonView()
        view2.backgroundColor = .orange

        let view3 = BottomButtonView()
        view3.backgroundColor = .orange

        let view4 = BottomButtonView()
        view4.backgroundColor = .orange

        let view5 = BottomButtonView()
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
        ].forEach { $0.isActive = true }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class BottomButtonView: UIView {
    
    //他からも参照できるように変数として持たせておく
    var button: UIButton?
    
    //クラスを参照するとここの全ての設定が入った状態で作成
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button = UIButton(type: .system)
        button?.setTitle("tap", for: .normal)
        button?.translatesAutoresizingMaskIntoConstraints = false
        button?.backgroundColor = .white
        button?.layer.cornerRadius = 25
        button?.layer.shadowOffset = .init(width: 1.5, height: 2)
        button?.layer.shadowColor = UIColor.black.cgColor
        button?.layer.shadowOpacity = 0.3
        button?.layer.shadowRadius = 15
        
        //ボタン追加
        addSubview(button!)
        
        //ボタンを_軸中心に配置 & 幅と高さを指定
        [button?.centerYAnchor.constraint(equalTo: centerYAnchor),
        button?.centerXAnchor.constraint(equalTo: centerXAnchor),
        button?.widthAnchor.constraint(equalToConstant: 50),
        button?.heightAnchor.constraint(equalToConstant: 50)].forEach { $0?.isActive = true }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
