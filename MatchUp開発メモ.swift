//
//  Storyboardを使用しない方法
//

・SB削除
・Sceneデリゲート削除
・Appデリゲート第一関数以外削除

ーーー【AppDelegate.swift】ーーー
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        //表示画面
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        //初期画面
        window?.rootViewController = ViewController()

        return true
    }
ーーー【AppDelegate.swift】ーーー

・最左C
＞アプリ名
＞Main Interface：削除
・最左C
＞Info.plist
＞Application Scene Manifest：削除
（＞Storyboard Name：削除）




//
//  スタックの基本構造
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //配色
        let view1 = UIView()
        view1.backgroundColor = .yellow
        let view2 = UIView()
        view2.backgroundColor = .blue
        let view3 = UIView()
        view3.backgroundColor = .green

        //画面構成が複数　→　UIStackView
        let stackView = UIStackView(arrangedSubviews: [view1, view2, view3])
        //AutoLayoutに必須
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //分割
        stackView.axis = .vertical
        stackView.distribution = .fillEqually

        //大元のViewにstackViewを入れる
        self.view.addSubview(stackView)

        //配置(AutoLayout)
        [stackView.topAnchor.constraint(equalTo: view.topAnchor),
         stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
         stackView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach { $0.isActive = true }
    }
}




//
//  個別ビュー作成方法
//

import UIKit

class BottomControlView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .purple
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




//
//  ボタンの基本構造
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




//
//  コマンド　名前一括変換
//

・control + command + E




//
//  SwiftPackageManagerを使ってRxSwiftを導入する
//

・最左C
＞アプリ名
＞Project：アプリ名選択
＞上部タブ：SwiftPackages
＞＋ボタン：選択
＞検索窓：（使いたいライブラリのURL）
＞Version：Exact（バージョン指定）、6.0.0
＞検索結果：RxCocoa、RxRelay、RxSwiftにチェック


//
//  RxCocoaを使ってボタンを配置する
//

import RxCocoa
import RxSwift

class TopControlView: UIView {

    //ボタンの選択・非選択処理で利用(setupBindings())
    private let disposeBag = DisposeBag()

    //画面上部で利用するボタンの設定
    let tinderButton = createTopButton(imageName: "tinder-selected")

    //ボタンの選択・非選択処理
    private func setupBindings() {
        //RxSwiftのメソッド
        tinderButton.rx.tap
            .subscribe { _ in
                //tapした時の処理
                print(#function)
            }
            .disposed(by: disposeBag)
    }
}

