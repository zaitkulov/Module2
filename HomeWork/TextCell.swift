//
//  TextCell.swift
//  HomeWork
//
//  Created by Артем Заиткулов on 31.01.2024.
//

import UIKit


final class TableCell: UITableViewCell {
    
    private lazy var someView: UIView = {
        $0.backgroundColor = UIColor(_colorLiteralRed: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        $0.layer.cornerRadius = 30
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private lazy var dogImage: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .heavy)
        $0.numberOfLines = 0
        $0.sizeToFit()
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var descriptionLabel: UILabel = {
        $0.font = .systemFont(ofSize: 16)
        $0.numberOfLines = 0
        $0.sizeToFit()
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(someView)
        addSubview(dogImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        setConstraints()
    }
    
    func configCell(item: DogBreed) {
        self.dogImage.image = item.image
        self.titleLabel.text = item.titleLabel
        self.descriptionLabel.text = item.descriptionLabel
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            someView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            someView.trailingAnchor.constraint(equalTo: trailingAnchor),
            someView.leadingAnchor.constraint(equalTo: leadingAnchor),
            someView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            dogImage.topAnchor.constraint(equalTo: someView.topAnchor, constant: 14),
            dogImage.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 10),
            dogImage.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -10),
            dogImage.heightAnchor.constraint(equalTo: dogImage.widthAnchor),
                        
            titleLabel.topAnchor.constraint(equalTo: dogImage.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 34),
            titleLabel.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
            descriptionLabel.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(equalTo: someView.bottomAnchor, constant: -30),
            descriptionLabel.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -10)
        ])
    }
}
