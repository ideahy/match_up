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
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "cherry-blossoms")
        iv.clipsToBounds = true
        return iv
    }()
    
    //ユーザーネームの設定
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .heavy)
        label.textColor = .white
        label.text = "Taro, 22"
        return label
    }()
    
    //infoボタン
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "info.circle.fill")?.resize(size: .init(width: 40, height: 40)), for: .normal)
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
        
    //ユーザー情報１
    let residenceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.text = "日本、大阪"
        return label
    }()
    
    //ユーザー情報２
    let hobbyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.textColor = .white
        label.text = "ランニング"
        return label
    }()
    
    //ユーザー情報３
    let introductionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.textColor = .white
        label.text = "走り回るのが大好きです"
        return label
    }()
    
    //Goodラベル
    let goodLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 45)
        label.text = "GOOD"
        label.textColor = .rgb(red: 137, green: 223, blue: 86)
        
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.rgb(red: 137, green: 223, blue: 86).cgColor
        label.layer.cornerRadius = 10
        
        label.textAlignment = .center
        label.alpha = 0
        return label
    }()
    
    //Nopeラベル
    let nopeLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 45)
        label.text = "NOPE"
        label.textColor = .rgb(red: 222, green: 110, blue: 110)
        
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.rgb(red: 222, green: 110, blue: 110).cgColor
        label.layer.cornerRadius = 10

        label.textAlignment = .center
        label.alpha = 0
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        
        //スワイプ機能
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCardView))
        self.addGestureRecognizer(panGesture)
    }
    
    @objc private func panCardView(gesture: UIPanGestureRecognizer) {
        //動かしている時の動きと手を離した時の動き
        let translation = gesture.translation(in: self)
        
        if gesture.state == .changed {
            self.handlePanChange(translation: translation)
            
        } else if gesture.state == .ended {
            self.handlePanEnded()
        }
    }
    
    //スワイプ動作時の設定
    private func handlePanChange(translation: CGPoint) {
        let degree:CGFloat = translation.x / 20
        let angle = degree * .pi / 100 //pi=円周率
        
        let rotateTranslation = CGAffineTransform(rotationAngle: angle)
        self.transform = rotateTranslation.translatedBy(x: translation.x, y: translation.y)
        
        //alpha最大値＝１(右側＋、左側ー)
        let ratio: CGFloat = 1 / 100
        let ratioValue = ratio * translation.x
        
        //右側にある時
        if translation.x > 0 {
            self.goodLabel.alpha = ratioValue
        } else if translation.x < 0 {
            self.nopeLabel.alpha = -ratioValue
        }
    }
    
    //スワイプ終了時の設定
    private func handlePanEnded() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: []) {
            self.transform = .identity
            //animationを認識
            self.layoutIfNeeded()
            self.goodLabel.alpha = 0
            self.nopeLabel.alpha = 0
        }
    }
    
    
    private func setupLayout() {
        //ユーザー情報用StackView
        let infoVerticalStackView = UIStackView(arrangedSubviews: [residenceLabel, hobbyLabel, introductionLabel])
        infoVerticalStackView.axis = .vertical
        
        //ユーザー情報用 & 右側infoボタン用StackView
        let baseStackView = UIStackView(arrangedSubviews: [infoVerticalStackView, infoButton])
        baseStackView.axis = .horizontal
        
        //表示
        addSubview(cardImageView)
        addSubview(nameLabel)
        addSubview(baseStackView)
        addSubview(goodLabel)
        addSubview(nopeLabel)

        //配置
        cardImageView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, leftPadding: 10, rightPadding: 10)
        infoButton.anchor(width: 40)
        baseStackView.anchor(bottom: cardImageView.bottomAnchor, left: cardImageView.leftAnchor, right: cardImageView.rightAnchor, bottomPadding: 20, leftPadding: 20, rightPadding: 20)
        nameLabel.anchor(bottom: baseStackView.topAnchor, left: cardImageView.leftAnchor, bottomPadding: 10, leftPadding: 20)
        goodLabel.anchor(top: cardImageView.topAnchor, left: cardImageView.leftAnchor, width: 140, height: 55, topPadding: 25, leftPadding: 20)
        nopeLabel.anchor(top: cardImageView.topAnchor, right: cardImageView.rightAnchor, width: 140, height: 55, topPadding: 25, rightPadding: 20)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
