//
//  TopControlView.swift
//  MatchUp
//
//  Created by 山本英明 on 2021/04/23.
//

//
//  Rxcocoaを使って選択or非選択の分岐を行う
//  SwiftPackageManagerを使って導入する
//




import UIKit
//  Rxcocoaを使って選択or非選択の分岐を行う
import RxCocoa
import RxSwift

class TopControlView: UIView {
    
    //ボタンの選択・非選択処理で利用(setupBindings())
    private let disposeBag = DisposeBag()
    
    //画面上部で利用するボタンの設定
    let tinderButton = createTopButton(selectedImage: "tinder-selected", unselectedImage: "tinder-unselected")
    let goodButton = createTopButton(selectedImage: "good-selected", unselectedImage: "good-unselected")
    let commentButton = createTopButton(selectedImage: "comment-selected", unselectedImage: "comment-unselected")
    let profileButton = createTopButton(selectedImage: "profile-selected", unselectedImage: "profile-unselected")

    //メソッドを利用してボタンを効率的に複数作る
    //init外ではstaticをつけないと使えない
    static private func createTopButton(selectedImage: String, unselectedImage: String) -> UIButton {
        let button = UIButton(type: .custom)
        //select状態のイメージを登録
        button.setImage(UIImage(named: selectedImage), for: .selected)
        button.setImage(UIImage(named: unselectedImage), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }
    
    //クラス参照時自動呼び出し
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        setupBindings()
    }
    
    //レイアウトの設定
    private func setupLayout() {
        //UIStackViewを作成 & []内呼び出し
        let baseStackView = UIStackView(arrangedSubviews: [tinderButton, goodButton, commentButton, profileButton])
        //横分割
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 43
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        //対象ViewにstackViewを入れる
        addSubview(baseStackView)
        
        baseStackView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, leftPadding: 40, rightPadding: 40)
        
        //配置(AutoLayout) & constantは両端の余白
//        [baseStackView.topAnchor.constraint(equalTo: topAnchor),
//         baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//         baseStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
//         baseStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
//        ].forEach { $0.isActive = true }
        
        //初期選択ボタン
        tinderButton.isSelected = true
    }
    
    //ボタンの選択・非選択処理
    private func setupBindings() {
        //RxSwiftのメソッド
        tinderButton.rx.tap
            //.subscribe { _ in を加工したもの -> メインスレッドで実行される & エラーが起きない
            //tapの処理がドライバーに変更
            .asDriver()
            //循環参照を防ぐ
            .drive(onNext: { [weak self] in
                //tapした時の処理
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.tinderButton)
            })
            .disposed(by: disposeBag)

        goodButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.goodButton)
            })
            .disposed(by: disposeBag)

        commentButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.commentButton)
            })
            .disposed(by: disposeBag)

        profileButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.profileButton)
            })
            .disposed(by: disposeBag)
    }
    
    private func handleSelectedButton(selectedButton: UIButton) {
        //全てのボタン入り配列作成　→　選択したボタンが来た時だけselectedImageに変える
        let buttons = [tinderButton, goodButton, commentButton, profileButton]
        
        buttons.forEach { button in
            if button == selectedButton {
                //true -> .selectedImageが呼ばれる
                button.isSelected = true
            } else {
                button.isSelected = false
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
