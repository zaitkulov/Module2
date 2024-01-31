//
//  SecondViewController.swift
//  HomeWork
//
//  Created by Артем Заиткулов on 31.01.2024.
//

import UIKit

class SecondViewController: UIViewController {

    var delegate: ViewControllerDelegate?


    lazy var nameLabel = {
        let name = UILabel()
        name.text = "Введите ваши данные"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return name
    }()


    lazy var someView: UIView = {
                let v = UIView()
                v.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
                v.layer.cornerRadius = 20
                v.translatesAutoresizingMaskIntoConstraints = false
                v.clipsToBounds = true
                return v
            }()

    func smallView(text: String) -> UIView{
        let sv = UIView()
        sv.backgroundColor = .white
        sv.layer.cornerRadius = 25
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.clipsToBounds = true
        return sv
    }
    lazy var smallView1 = smallView(text: "1")
    lazy var smallView2 = smallView(text: "2")

    func addText(text : String) -> UITextField{
        let txt = UITextField()
        txt.textAlignment = .left
        txt.backgroundColor = .white
        txt.placeholder = text
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }

    lazy var nameText = addText(text: "Имя")
    lazy var surnameText = addText(text: "Фамилия")

    lazy var vStack: UIStackView = {
        $0.axis = .vertical
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        $0.alignment = .fill
        $0.spacing = 15
        $0.distribution = .fillProportionally
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(smallView1)
        $0.addArrangedSubview(smallView2)

        return $0
    }(UIStackView())

    lazy var saveButtonn: UIButton = {
        let saveBtn = UIButton(primaryAction: backBtnAction)
        saveBtn.backgroundColor = .black
        saveBtn.setTitle("Сохранить", for: .normal)
        saveBtn.setTitleColor(.white, for: .normal)
        saveBtn.layer.cornerRadius = 25
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
                    return saveBtn
            }()

    lazy var saveGuard: UIView = {
                let saveView = UIView()
        saveView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        saveView.layer.cornerRadius = 25
        saveView.clipsToBounds = true
        saveView.translatesAutoresizingMaskIntoConstraints = false
                return saveView
            }()

    lazy var saveStack: UIStackView = {
        $0.axis = .vertical
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        $0.alignment = .fill
        $0.spacing = 30
        $0.distribution = .fillProportionally
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(saveGuard)
        $0.addArrangedSubview(saveButtonn)
        $0.addArrangedSubview(UIView())

        return $0
}(UIStackView())




    lazy var globalVStack: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        $0.spacing = 10
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(vStack)
        $0.addArrangedSubview(saveStack)


        return $0

    }(UIStackView())

    lazy var backBtnAction = UIAction {_ in
        lazy var text = (self.nameText.text ?? " ") + " " + (self.surnameText.text ?? " ")
        self.delegate?.setLabelText(text: text)

                self.navigationController?.popViewController(animated: true)
            }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(nameLabel)
        view.addSubview(someView)
        view.addSubview(vStack)
        smallView1.addSubview(nameText)
        smallView2.addSubview(surnameText)
        view.addSubview(globalVStack)

        
        NSLayoutConstraint.activate([
        
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            someView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            someView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            someView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            someView.widthAnchor.constraint(equalToConstant: 400),
            someView.heightAnchor.constraint(equalToConstant: 260),
            
            globalVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            globalVStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            globalVStack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            globalVStack.widthAnchor.constraint(equalToConstant: 200),
            globalVStack.heightAnchor.constraint(equalToConstant: 230),
            nameText.leadingAnchor.constraint(equalToSystemSpacingAfter: smallView1.leadingAnchor, multiplier: 2),
            nameText.topAnchor.constraint(equalTo: smallView1.topAnchor, constant: 12),
            surnameText.leadingAnchor.constraint(equalToSystemSpacingAfter: smallView2.leadingAnchor, multiplier: 2),
            surnameText.topAnchor.constraint(equalTo: smallView2.topAnchor, constant: 12),
            
    
        ])

    }


}
