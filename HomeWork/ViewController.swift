//
//  ViewController.swift
//  HomeWork
//
//  Created by Артем Заиткулов on 14.01.2024.
//

import UIKit

protocol ViewControllerDelegate{
    func setLabelText(text: String)
}

class ViewController: UIViewController, ViewControllerDelegate {
    
    func setLabelText(text:String) {
        self.nameLabel.text = text
    }
    
    func someView(text: String) -> UIView{
            let v = UIView()
            v.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
            v.layer.cornerRadius = 10
            v.clipsToBounds = true
            return v
        }
    lazy var view1 = someView(text: "1")
    lazy var view2 = someView(text: "2")
    lazy var view3 = someView(text: "3")
    
    lazy var view1Stack = createVerticalStack(views: [friendsNumbers, friendsName], size: CGPoint(x: view1.center.x + 10, y: view1.center.y))
    
    lazy var view2Stack = createVerticalStack(views: [subscribeNumbers, subscribeName], size: CGPoint(x: view2.center.x + 10, y: view2.center.y))
    
    lazy var view3Stack = createVerticalStack(views: [favoriteNumbers, favoriteName], size: CGPoint(x: view3.center.x + 10, y: view3.center.y))
    
    private func Label(text: String, font: UIFont) -> UILabel{
            let label = UILabel()
            label.frame.size = CGSize(width: 60, height: 80)
            label.textColor = .black
            label.text = text
            label.textAlignment = .center
            label.font = font
            return label
        }
    
    lazy var friendsNumbers = Label(text: "1398", font: UIFont.systemFont(ofSize: 18, weight: .bold))
    
    lazy var friendsName = Label(text: "Друзей", font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    lazy var subscribeNumbers = Label(text: "2349", font: UIFont.systemFont(ofSize: 18, weight: .bold))
    
    lazy var subscribeName = Label(text: "Подписок", font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    lazy var favoriteNumbers = Label(text: "1372", font: UIFont.systemFont(ofSize: 18, weight: .bold))
    
    lazy var favoriteName = Label(text: "Избранных", font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    
    lazy var hStack: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.spacing = 20
        $0.distribution = .fillProportionally
        $0.addArrangedSubview(view1)
        $0.addArrangedSubview(view2)
        $0.addArrangedSubview(view3)
        
        return $0
    }(UIStackView(frame: CGRect(x: 30, y: view.center.y - 20, width: view.bounds.width - 60, height: 80)))
    
    private func createVerticalStack(views: [UIView], size: CGPoint) -> UIStackView {
        let stack = UIStackView()
        stack.frame.size = CGSize(width: 80, height: 80)
        stack.frame.origin = size
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.spacing = -40
        views.forEach { stack.addArrangedSubview($0)
        }
        return stack
    }

        lazy var AvatarImage: UIImageView = {
        lazy var img = UIImage(named: "1")
        AvatarImage = UIImageView(image: img)
        AvatarImage.frame.size = CGSize(width: 130, height: 130)
        AvatarImage.clipsToBounds = true
        AvatarImage.layer.cornerRadius = 65
        AvatarImage.contentMode = .scaleAspectFill
        return AvatarImage
    }()
    
    lazy var nameLabel: UILabel = {
            let label = UILabel()
            label.frame.size = CGSize(width: 300, height: 50)
            label.text = "Имя Фамилия"
            label.textAlignment = .center
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            return label
        }()
        
    lazy var settingsButton: UIButton = {
            let settBtn = UIButton(primaryAction: nextBtnAction)
        settBtn.frame.size = CGSize(width: 150, height: 30)
        settBtn.backgroundColor = view.backgroundColor
        settBtn.setTitle("Настройки", for: .normal)
        settBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        settBtn.setTitleColor(.blue, for: .normal)
        return settBtn
    }()
    
    lazy var nextBtnAction = UIAction {_ in
        let sc = SecondViewController()
        sc.delegate = self
        self.navigationController?.pushViewController(sc, animated: true)
        
    }
    lazy var globalVStack: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .center
        $0.backgroundColor = .white
        $0.distribution = .equalSpacing
        $0.spacing = 10
        $0.addArrangedSubview(AvatarImage)
        $0.addArrangedSubview(nameLabel)
        $0.addArrangedSubview(settingsButton)
        
        return $0
    
    }(UIStackView(frame: CGRect(x: 125, y: view.center.y - 240 , width: view.bounds.width - 260, height: view.bounds.height - 645 )))
    
    lazy var bigImage: UIImageView = {
    lazy var img = UIImage(named: "2")
        bigImage = UIImageView(image: img)
        bigImage.frame.size = CGSize(width: view.bounds.width - 60, height: view.bounds.height - 580)
        bigImage.frame.origin = CGPoint(x: 30, y: view.center.y + 80)
        bigImage.clipsToBounds = true
        bigImage.layer.cornerRadius = 20
        bigImage.contentMode = .scaleAspectFill
    return bigImage
}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        view.backgroundColor = .white
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true
        view1.addSubview(view1Stack)
        view2.addSubview(view2Stack)
        view3.addSubview(view3Stack)
        view.addSubview(globalVStack)
        view.addSubview(hStack)
        view.addSubview(bigImage)
        
    }


}

