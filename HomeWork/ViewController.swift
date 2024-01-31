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
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }
    lazy var view1 = someView(text: "1")
    lazy var view2 = someView(text: "2")
    lazy var view3 = someView(text: "3")
    
    lazy var view1Stack = createVerticalStack(views: [friendsNumbers, friendsName])
    
    lazy var view2Stack = createVerticalStack(views: [subscribeNumbers, subscribeName])
    
    lazy var view3Stack = createVerticalStack(views: [favoriteNumbers, favoriteName])
    
    private func Label(text: String, font: UIFont) -> UILabel{
        let label = UILabel()
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
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(view1)
        $0.addArrangedSubview(view2)
        $0.addArrangedSubview(view3)
    
        
        return $0
    }(UIStackView())
    
    private func createVerticalStack(views: [UIView]) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = -40
        views.forEach { stack.addArrangedSubview($0)
        }
        return stack
    }
    
    lazy var AvatarImage: UIImageView = {
        lazy var img = UIImage(named: "1")
        AvatarImage = UIImageView(image: img)
        AvatarImage.clipsToBounds = true
        AvatarImage.translatesAutoresizingMaskIntoConstraints = false
        AvatarImage.layer.cornerRadius = 65
        AvatarImage.contentMode = .scaleAspectFill
        return AvatarImage
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя Фамилия"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var settingsButton: UIButton = {
        let settBtn = UIButton(primaryAction: nextBtnAction)
        settBtn.backgroundColor = view.backgroundColor
        settBtn.setTitle("Настройки", for: .normal)
        settBtn.translatesAutoresizingMaskIntoConstraints = false
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
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 10
        $0.addArrangedSubview(AvatarImage)
        $0.addArrangedSubview(nameLabel)
        $0.addArrangedSubview(settingsButton)
        
        return $0
        
    }(UIStackView())
    
    lazy var bigImage: UIImageView = {
        lazy var img = UIImage(named: "2")
        bigImage = UIImageView(image: img)
        bigImage.clipsToBounds = true
        bigImage.layer.cornerRadius = 20
        bigImage.translatesAutoresizingMaskIntoConstraints = false
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
        
        NSLayoutConstraint.activate([
            AvatarImage.widthAnchor.constraint(equalToConstant: 130),
            AvatarImage.heightAnchor.constraint(equalToConstant: 130),
            globalVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            globalVStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            globalVStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            hStack.widthAnchor.constraint(equalToConstant: 200),
            hStack.heightAnchor.constraint(equalToConstant: 80),
            hStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            hStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            hStack.topAnchor.constraint(equalTo: globalVStack.bottomAnchor, constant: 10),
            view1Stack.widthAnchor.constraint(equalToConstant: 100),
            view1Stack.heightAnchor.constraint(equalToConstant: 80),
            view1Stack.leadingAnchor.constraint(equalTo: view1.leadingAnchor,constant: 10),
            view2Stack.widthAnchor.constraint(equalToConstant: 100),
            view2Stack.heightAnchor.constraint(equalToConstant: 80),
            view2Stack.leadingAnchor.constraint(equalTo: view2.leadingAnchor,constant: 10),
            view3Stack.widthAnchor.constraint(equalToConstant: 100),
            view3Stack.heightAnchor.constraint(equalToConstant: 80),
            view3Stack.leadingAnchor.constraint(equalTo: view3.leadingAnchor,constant: 10),
            bigImage.widthAnchor.constraint(equalToConstant: 200),
            bigImage.heightAnchor.constraint(equalToConstant: 300),
            bigImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bigImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bigImage.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 20)
        
        ])
    }
    
}
