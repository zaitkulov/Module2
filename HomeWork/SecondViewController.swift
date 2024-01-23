//
//  SecondViewController.swift
//  HomeWork
//
//  Created by Артем Заиткулов on 23.01.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    var delegate: ViewControllerDelegate?
    
    
    lazy var nameLabel = {
        let name = UILabel()
        name.frame.size = CGSize(width: 300, height: 50)
        name.text = "Введите ваши данные"
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        name.center.x = view.bounds.width - 220
        name.center.y = view.center.y - 200
        return name
    }()
    
    
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

    func smallView(text: String, point: CGPoint) -> UIView{
        let sv = UIView()
        sv.backgroundColor = .white
        sv.layer.cornerRadius = 25
        sv.clipsToBounds = true
        return sv
    }
    lazy var smallView1 = smallView(text: "1", point: CGPoint(x: view.center.x, y: view.center.y))
    lazy var smallView2 = smallView(text: "2", point: CGPoint(x: view.center.x, y: view.center.y))
    
    func addText(text : String, point: CGPoint) -> UITextField{
        let txt = UITextField()
        txt.frame.size = CGSize(width: 120, height: 55)
        txt.textAlignment = .left
        txt.backgroundColor = .white
        txt.placeholder = text
        txt.frame.origin = point
        return txt
    }
    
    lazy var nameText = addText(text: "Имя", point: CGPoint(x: smallView1.center.x + 20, y: smallView1.center.y - 3))
    lazy var surnameText = addText(text: "Фамилия", point: CGPoint(x: smallView2.center.x + 20, y: smallView2.center.y - 3))
    
    lazy var vStack: UIStackView = {
        $0.axis = .vertical
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        $0.alignment = .fill
        $0.spacing = 15
        $0.distribution = .fillProportionally
        $0.addArrangedSubview(smallView1)
        $0.addArrangedSubview(smallView2)

        return $0
    }(UIStackView(frame: CGRect(x: 30, y: view.center.y - 100, width: view.bounds.width - 60, height: view.bounds.height - 720 )))
    
    lazy var saveButtonn: UIButton = {
        let saveBtn = UIButton(primaryAction: backBtnAction)
        saveBtn.backgroundColor = .black
        saveBtn.center.x = view.center.x
        saveBtn.center.y = view.center.y + 80
        saveBtn.setTitle("Сохранить", for: .normal)
        saveBtn.setTitleColor(.white, for: .normal)
        saveBtn.layer.cornerRadius = 25
        saveBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
                    return saveBtn
            }()
    
    lazy var saveGuard: UIView = {
                let saveView = UIView()
        saveView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        saveView.center.x = view.center.x
        saveView.center.y = view.center.y
        saveView.layer.cornerRadius = 25
        saveView.clipsToBounds = true
                return saveView
            }()
    
    lazy var saveStack: UIStackView = {
        $0.axis = .vertical
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        $0.alignment = .fill
        $0.spacing = 30
        $0.distribution = .fillProportionally
        $0.addArrangedSubview(saveGuard)
        $0.addArrangedSubview(saveButtonn)
        $0.addArrangedSubview(UIView())
       
        return $0
}(UIStackView(frame: CGRect(x: 30, y: view.center.y - 100, width: view.bounds.width - 60, height: view.bounds.height - 720 )))
    
    
    
    
    lazy var globalVStack: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        $0.spacing = 10
        $0.distribution = .fillEqually
        $0.addArrangedSubview(vStack)
        $0.addArrangedSubview(saveStack)
        
        
        return $0
    
    }(UIStackView(frame: CGRect(x: 30, y: view.center.y - 100, width: view.bounds.width - 60, height: view.bounds.height - 620 )))
    
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
        

        
    }
    

}
