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

//ホームコントローラからも参照可能
//インスタンス化 & サイズ指定 & 配色
let reloadView = BottomButtonView(frame: .zero, width: 50, imageName: "reload")
let nopeView = BottomButtonView(frame: .zero, width: 60, imageName: "nope")
let superlikeView = BottomButtonView(frame: .zero, width: 50, imageName: "superlike")
let likeView = BottomButtonView(frame: .zero, width: 60, imageName: "like")
let boostView = BottomButtonView(frame: .zero, width: 50, imageName: "boost")

class BottomControlView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //UIStackViewを作成
        let baseStackView = UIStackView(arrangedSubviews: [reloadView,nopeView,superlikeView,likeView,boostView])
        
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
    
    //他からも参照できるように変数として持たせておく & 効果付きクラスを参照
    var button: BottomButton?
    
    //ボタンによってサイズの変更ができるようwidthを追加
    init(frame: CGRect, width: CGFloat, imageName: String) {
        super.init(frame: frame)
        
        //効果付きクラスを参照
        button = BottomButton(type: .custom)
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
        
        //UIView-Extension　→　ボタンを_軸中心に配置 & 幅と高さを指定
        button?.anchor(centerY: centerYAnchor, centerX: centerXAnchor, width: width, height: width)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//ボタンタップ時効果の追加
class BottomButton: UIButton {
    
    //isHighlighted = ボタンタップ中
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    
                    //タップ中はボタンを小さくする効果を追加
                    self.transform = .init(scaleX: 0.8, y: 0.8)
                    //レイアウトを自動で更新する
                    self.layoutIfNeeded()
                }
            } else {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    
                    //元の大きさに戻る
                    self.transform = .identity
                    //レイアウトを自動で更新する
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
