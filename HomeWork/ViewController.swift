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
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 200, height: 50)
        label.text = "Имя Фамилия"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.center.x = view.center.x
        label.center.y = view.center.y - 90
        return label
    }()
    
    lazy var myImageView = UIImageView()
    
    lazy var settingsButton: UIButton = {
        let settingsButton = UIButton(primaryAction: nextBtnAction)
        settingsButton.frame.size = CGSize(width: 150, height: 30)
        settingsButton.backgroundColor = view.backgroundColor
        settingsButton.center.x = view.center.x
        settingsButton.center.y = view.center.y - 60
        settingsButton.setTitle("Настройки", for: .normal)
        settingsButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        settingsButton.setTitleColor(.blue, for: .normal)
        return settingsButton
    }()
    
    lazy var nextBtnAction = UIAction {_ in
        let vc = SecondViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    lazy var someView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        v.frame.size = CGSize(width: 100, height: 80)
        v.center.x = view.center.x
        v.center.y = view.center.y
        v.layer.cornerRadius = 10
        v.clipsToBounds = true
        return v
    }()
    
    let AvatarImage = UIImage(named: "1")
    
    lazy var subscribeLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: someView.bounds.width + 20, height: someView.bounds.height + 10)
        label.textColor = .black
        label.text = "1398"
        label.frame.origin = CGPoint(x: someView.bounds.width/2 - 40,
                                     y: someView.bounds.height/2 - 60)
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var subscribeLabel2: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 100, height: 80)
        label.textColor = .black
        label.text = "Подписок"
        label.frame.origin = CGPoint(x: someView.bounds.width/2 - 40,
                                     y: someView.bounds.height/2 - 30)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var someView2: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        v.frame.size = CGSize(width: 100, height: 80)
        v.center.x = view.center.x - 120
        v.center.y = view.center.y
        v.layer.cornerRadius = 10
        v.clipsToBounds = true
        return v
    }()
    
    var friendsLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 100, height: 20)
        label.textColor = .black
        label.text = "2356"
        label.frame.origin = CGPoint(x: 10 , y: 15)
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    var friendsLabel2: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 100, height: 20)
        label.textColor = .black
        label.text = "Друзей"
        label.frame.origin = CGPoint(x: 10,
                                     y: 40)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var someView3: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        v.frame.size = CGSize(width: 100, height: 80)
        v.center.x = view.center.x + 120
        v.center.y = view.center.y
        v.layer.cornerRadius = 10
        v.clipsToBounds = true
        return v
    }()
    
    var favoriteLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 100, height: 20)
        label.textColor = .black
        label.text = "213"
        label.frame.origin = CGPoint(x: 10,
                                     y: 15)
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    var favoriteLabel2: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 100, height: 80)
        label.textColor = .black
        label.text = "Избранных"
        label.frame.origin = CGPoint(x: 10,
                                     y: 10)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var myImageView2 = UIImageView()
    let AvatarImage2 = UIImage(named: "2")
    
    func setLabelText(text: String) {
        self.nameLabel.text = text
    }
override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
        myImageView = UIImageView(image: AvatarImage)
        myImageView.frame.size = CGSize(width: 130, height: 130)
        myImageView.center.x = view.center.x
        myImageView.center.y = view.center.y - 180
        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = 65
        myImageView.contentMode = .scaleAspectFill
        view.addSubview(myImageView)
        view.addSubview(nameLabel)
        view.addSubview(settingsButton)
        
    
        view.addSubview(someView)
        someView.addSubview(subscribeLabel)
        someView.addSubview(subscribeLabel2)
        
    
        view.addSubview(someView2)
        someView2.addSubview(friendsLabel)
        someView2.addSubview(friendsLabel2)
        
        
        view.addSubview(someView3)
        someView3.addSubview(favoriteLabel)
        someView3.addSubview(favoriteLabel2)
        
        
        
        myImageView = UIImageView(image: AvatarImage2)
        myImageView.frame.size = CGSize(width: view.bounds.width - 60, height: view.bounds.height - 580)
        myImageView.center.x = view.center.x
        myImageView.center.y = view.center.y + 200
        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = 20
        myImageView.contentMode = .scaleAspectFill
        view.addSubview(myImageView)
    }
}

   




