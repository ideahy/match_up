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
        
        //インスタンス化 & サイズ指定 & 配色
        let view1 = BottomButtonView(frame: .zero, width: 50, imageName: "reload")
        view1.backgroundColor = .orange
        
        let view2 = BottomButtonView(frame: .zero, width: 60, imageName: "nope")
        view2.backgroundColor = .orange

        let view3 = BottomButtonView(frame: .zero, width: 50, imageName: "superlike")
        view3.backgroundColor = .orange

        let view4 = BottomButtonView(frame: .zero, width: 60, imageName: "like")
        view4.backgroundColor = .orange

        let view5 = BottomButtonView(frame: .zero, width: 50, imageName: "boost")
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


//クラスを参照するとここの全ての設定が入った状態で作成
class BottomButtonView: UIView {
    
    //他からも参照できるように変数として持たせておく
    var button: UIButton?
    
    //ボタンによってサイズの変更ができるようwidthを追加
    init(frame: CGRect, width: CGFloat, imageName: String) {
        super.init(frame: frame)
        
        button = UIButton(type: .custom)
        button?.setImage(UIImage(named: imageName )?.resize(size: .init(width: width * 0.4, height: width * 0.4)), for: .normal)
        //タイトルを画像に変更するため削除 → button?.setTitle("tap", for: .normal)
        button?.translatesAutoresizingMaskIntoConstraints = false
        button?.backgroundColor = .white
        button?.layer.cornerRadius = width / 2
        button?.layer.shadowOffset = .init(width: 1.5, height: 2)
        button?.layer.shadowColor = UIColor.black.cgColor
        button?.layer.shadowOpacity = 0.3
        button?.layer.shadowRadius = 15
        
        //ボタン追加
        addSubview(button!)
        
        //ボタンを_軸中心に配置 & 幅と高さを指定
        [button?.centerYAnchor.constraint(equalTo: centerYAnchor),
        button?.centerXAnchor.constraint(equalTo: centerXAnchor),
        button?.widthAnchor.constraint(equalToConstant: width),
        button?.heightAnchor.constraint(equalToConstant: width)].forEach { $0?.isActive = true }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
