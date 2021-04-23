//
//  ViewController.swift
//  MatchUp
//
//  Created by 山本英明 on 2021/04/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        //配色
        let view1 = TopControlView()
        let view2 = UIView()
        view2.backgroundColor = .blue
        let bottomControlView = BottomControlView()
        
        //画面構成が複数　→　UIStackView
        let stackView = UIStackView(arrangedSubviews: [view1, view2, bottomControlView])
        //AutoLayoutに必須
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //縦分割
        stackView.axis = .vertical
        
        //大元のViewにstackViewを入れる
        self.view.addSubview(stackView)
        
        //配置(AutoLayout)
        [
            view1.heightAnchor.constraint(equalToConstant: 100),
            bottomControlView.heightAnchor.constraint(equalToConstant: 120),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor)]
            .forEach { $0.isActive = true }
    }
}

