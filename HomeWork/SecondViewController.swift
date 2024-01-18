//
//  SecondViewController.swift
//  HomeWork
//
//  Created by Артем Заиткулов on 18.01.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    var delegate: ViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
        view.backgroundColor = .white
        
        lazy var nameLabel = UILabel()
        nameLabel.frame.size = CGSize(width: 300, height: 50)
        nameLabel.text = "Введите ваши данные"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        nameLabel.center.x = view.bounds.width - 220
        nameLabel.center.y = view.center.y - 200
        view.addSubview(nameLabel)
        
        lazy var someView: UIView = {
            let v = UIView()
            v.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
            v.frame.size = CGSize(width: view.bounds.width - 40, height: view.bounds.height - 580)
            v.center.x = view.center.x
            v.center.y = view.center.y
            v.layer.cornerRadius = 20
            v.clipsToBounds = true
            return v
        }()
        view.addSubview(someView)
        
        var nameView = UIView()
        var nameText = UITextField()
        
        nameView.frame.size = CGSize(width: view.frame.width - 66, height: 50)
        nameView.backgroundColor = .white
        nameView.layer.cornerRadius = 25
        nameView.center.x = view.center.x
        nameView.center.y = view.center.y - 80
        
        nameText.frame.size = CGSize(width: view.frame.width - 110, height: 45)
        nameText.textAlignment = .left
        nameText.center.x = nameView.center.x
        nameText.center.y = nameView.center.y
        nameText.backgroundColor = .white
        nameText.placeholder = "Имя"
        
        view.addSubview(nameView)
        view.addSubview(nameText)
        
        var surnameView = UIView()
        var surnameText = UITextField()
        
        surnameView.frame.size = CGSize(width: view.frame.width - 66, height: 50)
        surnameView.backgroundColor = .white
        surnameView.layer.cornerRadius = 25
        surnameView.center.x = view.center.x
        surnameView.center.y = view.center.y - 10
        
        surnameText.frame.size = CGSize(width: view.frame.width - 110, height: 45)
        surnameText.textAlignment = .left
        surnameText.center.x = surnameView.center.x
        surnameText.center.y = surnameView.center.y
        surnameText.backgroundColor = .white
        surnameText.placeholder = "Фамилия"
        
        view.addSubview(surnameView)
        view.addSubview(surnameText)
        
        lazy var saveBtn: UIButton = {
            let saveBtn = UIButton(primaryAction: lastBtnAction)
            saveBtn.backgroundColor = .black
            saveBtn.frame.size = CGSize(width: view.frame.width - 66, height: 50)
            saveBtn.center.x = view.center.x
            saveBtn.center.y = view.center.y + 80
            saveBtn.setTitle("Сохранить", for: .normal)
            saveBtn.setTitleColor(.white, for: .normal)
            saveBtn.layer.cornerRadius = 25
            saveBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            return saveBtn
        }()
        
        var lastBtnAction = UIAction {_ in
            let text = (nameText.text ?? " ") + " " + (surnameText.text ?? " ")
            self.delegate?.setLabelText(text: text)

            self.navigationController?.popViewController(animated: true)
        }
        view.addSubview(saveBtn)
        
    }
}
