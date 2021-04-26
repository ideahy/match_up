//
//  CardView.swift
//  MatchUp
//
//  Created by 山本英明 on 2021/04/26.
//

import UIKit

class CardView: UIView {
    
    //Card画像の設定
    let cardImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.layer.cornerRadius = 10
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    //Cardテキスト情報の設定
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .heavy)
        label.textColor = .white
        label.text = "Taro, 22"
        return label
    }()
    
    //右側infoボタン
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "info.circle.fill")?.resize(size: .init(width: 40, height: 40)), for: .normal)
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //ユーザー情報用 & 右側infoボタン用StackView
        let baseStackView = UIStackView(arrangedSubviews: [infoButton])
        baseStackView.axis = .horizontal
        
        
        //表示
        addSubview(cardImageView)
        addSubview(nameLabel)
        addSubview(baseStackView)
        
        //配置
        cardImageView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, leftPadding: 10, rightPadding: 10)
        baseStackView.anchor(bottom: cardImageView.bottomAnchor, left: cardImageView.leftAnchor, right: cardImageView.rightAnchor, bottomPadding: 20, leftPadding: 20, rightPadding: 20)
        nameLabel.anchor(bottom: baseStackView.topAnchor, left: cardImageView.leftAnchor, bottomPadding: 40, leftPadding: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
