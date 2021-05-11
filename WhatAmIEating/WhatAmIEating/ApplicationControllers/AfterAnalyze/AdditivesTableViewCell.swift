//
//  AdditivesTableViewCell.swift
//  WhatAmIEating
//
//  Created by Peterses on 11/05/2021.
//

import UIKit

class AdditivesTableViewCell: UITableViewCell {

    var number: UILabel = UILabel()
    var name: UILabel = UILabel()
    var status: UILabel = UILabel()
    var descriptionLabel: UILabel = UILabel()
    
    var topView: UIView = UIView()
    var vStack = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(number: String, name: String, status: String, descriptionLabel: String) {
        setConstraints()
        self.number.text = number
        self.name.text = name
        self.status.text = status
        self.descriptionLabel.text = descriptionLabel
    }
    
    func setConstraints() {
        
        vStack.addArrangedSubview(number)
        vStack.addArrangedSubview(name)
        vStack.addArrangedSubview(status)
        vStack.addArrangedSubview(descriptionLabel)
        
        vStack.axis = .vertical
        vStack.distribution = .equalSpacing
        vStack.spacing = 8
        vStack.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            vStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            vStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            vStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
        
        number.font = .boldSystemFont(ofSize: 30)
        name.font = .boldSystemFont(ofSize: 20)

        
        descriptionLabel.textColor = .init(red: 124.0/255.0, green: 124.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .light)
        
        descriptionLabel.numberOfLines = 0
    }

}
