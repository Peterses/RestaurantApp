//
//  MainView.swift
//  WhatAmIEating
//
//  Created by Peterses on 22/03/2021.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    
    func didChooseButtonClicked()
    func didAnalyzeButtonClicked()
    
}

class MainView: UIView {
    
    var delegate: MainViewDelegate?
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        imageView.layer.borderWidth = 0.1
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private lazy var chooseImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemBlue
        button.setTitle("Choose image", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.systemGray, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.2
        return button
    }()
    
    private lazy var takePhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Take photo", for: .normal)
        button.tintColor = .systemBlue
        button.backgroundColor = .white
        button.setTitleColor(.systemGray, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.2
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    //    private lazy var analyzeButton: UIButton = {
    //        let button = UIButton()
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        button.setTitle("Analyze image", for: .normal)
    //        button.backgroundColor = .white
    //        button.setTitleColor(.systemGray, for: .normal)
    //        button.layer.cornerRadius = 10
    //        button.layer.borderWidth = 0.2
    //        return button
    //    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let readMe = "Wybierz zdjęcie z biblioteki, które chcesz przeanalizować lub zrób nowe zdjęcie (kliknij odpowiedni przycisk powyżej).".uppercased()
        label.text = readMe
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = .init(red: 124.0/255.0, green: 124.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        label.font = .systemFont(ofSize: 13, weight: .light)
        return label
    }()
    
    private func setImageView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
        ])
    }
    
    private func setButtonStackView() {
        buttonStackView.addArrangedSubview(chooseImageButton)
        buttonStackView.addArrangedSubview(takePhotoButton)
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            buttonStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            buttonStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -15)
        ])
    }
    
    private lazy var bottomView: UIView = {
        let view = UIView()
//        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setBottomView() {
        NSLayoutConstraint.activate([
//            bottomView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 15),
            bottomView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            bottomView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            bottomView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15),
//            bottomView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setTextView() {

        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: bottomView.topAnchor),
            infoLabel.rightAnchor.constraint(equalTo: bottomView.rightAnchor),
            infoLabel.leftAnchor.constraint(equalTo: bottomView.leftAnchor),
        ])
        
        infoLabel.sizeToFit()
    }
    
    func setImage(image: UIImage) {
        imageView.image = image
    }
    
    private func setChooseButton() {
        chooseImageButton.addTarget(self, action: #selector(selectPhotoButton), for: .touchUpInside)
    }
    
    private func setAnalyzeButton() {
        //        analyzeButton.addTarget(self, action: #selector(analyzeImageButton), for: .touchUpInside)
    }
    
    private func setButton() {
        //        NSLayoutConstraint.activate([
        //            analyzeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        //            analyzeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100)
        //        ])
    }
    
    @objc private func selectPhotoButton() {
        self.delegate?.didChooseButtonClicked()
    }
    
    @objc private func analyzeImageButton() {
        self.delegate?.didAnalyzeButtonClicked()
    }
    
    private func addSubviews() {
        addSubview(imageView)
        //        addSubview(analyzeButton)
        addSubview(bottomView)
        bottomView.addSubview(infoLabel)
        addSubview(buttonStackView)
//        addSubview(infoLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setImageView()
        setButton()
        setBottomView()
        setButtonStackView()
        setChooseButton()
        setAnalyzeButton()
        setTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
