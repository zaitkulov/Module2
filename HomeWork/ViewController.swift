//
//  ViewController.swift
//  HomeWork
//
//  Created by Артем Заиткулов on 14.01.2024.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel = UILabel()
    var label2: UILabel = UILabel()
    var textField1: UITextField = UITextField()
    var textField2: UITextField = UITextField()
    var view1: UIView = UIView()
    var view2: UIView = UIView()
    var regBtn: UIButton = UIButton()
    var btn1: UIButton = UIButton()
    var btn2: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 8/255, green: 83/255, blue: 138/255, alpha: 1)
        
        label.frame = CGRect(x: 33, y: 200, width: 200, height: 50)
        view.addSubview(label)
        label.text = "Авторизация"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        label2.frame = CGRect(x: 33, y: 250, width: view.frame.width - 66, height: 50)
        view.addSubview(label2)
        label2.text = "Пожалуйста, введите ваши личные данные для авторизации в системе"
        label2.textColor = .white
        label2.font = UIFont.systemFont(ofSize: 15)
        label2.numberOfLines = 2
        
        view.addSubview(view1)
        view1.frame.size = CGSize(width: view.frame.width - 66, height: 50)
        view1.backgroundColor = .white
        view1.layer.cornerRadius = 25
        view1.center.x = view.center.x
        view1.center.y = view.center.y
        
        view.addSubview(textField1)
        textField1.frame.size = CGSize(width: view.frame.width - 110, height: 45)
        textField1.textAlignment = .left
        textField1.center.x = view.center.x
        textField1.center.y = view.center.y + 0
        textField1.backgroundColor = .white
        textField1.text = nil
        textField1.placeholder = "Пароль"
        
        view.addSubview(view2)
        view2.frame.size = CGSize(width: view.frame.width - 66, height: 50)
        view2.backgroundColor = .white
        view2.layer.cornerRadius = 25
        view2.center.x = view.center.x
        view2.center.y = view.center.y - 75
        
        view.addSubview(textField2)
        textField2.frame.size = CGSize(width: view.frame.width - 110, height: 45)
        textField2.textAlignment = .left
        textField2.center.x = view.center.x
        textField2.center.y = view.center.y - 75
        textField2.backgroundColor = .white
        textField2.text = nil
        textField2.placeholder = "Email"
            
        view.addSubview(regBtn)
        regBtn.backgroundColor = .white
        regBtn.frame.size = CGSize(width: view.frame.width - 66, height: 50)
        regBtn.center.x = view.center.x
        regBtn.center.y = view.center.y + 90
        regBtn.setTitle("Войти", for: .normal)
        regBtn.setTitleColor(.systemBlue, for: .normal)
        regBtn.layer.cornerRadius = 25
        regBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        view.addSubview(btn1)
        btn1.frame.size = CGSize(width: view.frame.width - 66, height: 10)
        btn1.backgroundColor = UIColor(red: 8/255, green: 83/255, blue: 138/255, alpha: 1)
        btn1.center.x = view.center.x
        btn1.center.y = view.center.y + 140
        btn1.setTitle("Регистрация", for: .normal)
        btn1.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        btn1.tintColor = .white
        

        view.addSubview(btn2)
        btn2.frame.size = CGSize(width: view.frame.width - 66, height: 10)
        btn2.backgroundColor = UIColor(red: 8/255, green: 83/255, blue: 138/255, alpha: 1)
        btn2.center.x = view.center.x
        btn2.center.y = view.center.y + 360
        btn2.setTitle("Забыли пароль?", for: .normal)
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        btn2.tintColor = .white
        
    }
    
}

