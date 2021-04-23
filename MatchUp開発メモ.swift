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
//  個別のビューを作成
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
