//
//  MainView.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 01/10/2023.
//

import UIKit

class MainView: UIView {

    public init() {
        super.init(frame: .zero)
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(titleImage)
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -280),
            titleImage.heightAnchor.constraint(equalToConstant: 220),
            titleImage.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -145),
            title.heightAnchor.constraint(equalToConstant: 100),
            title.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        addSubview(antennaImage)
        antennaImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            antennaImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            antennaImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            antennaImage.heightAnchor.constraint(equalToConstant: 130),
            antennaImage.widthAnchor.constraint(equalToConstant: 130)
        ])
        
        addSubview(gameSelectionImage)
        gameSelectionImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameSelectionImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameSelectionImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200),
            gameSelectionImage.heightAnchor.constraint(equalToConstant: 150),
            gameSelectionImage.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        addSubview(leftButton)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -120),
            leftButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200),
            leftButton.heightAnchor.constraint(equalToConstant: 60),
            leftButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        addSubview(rightButton)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 120),
            rightButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200),
            rightButton.heightAnchor.constraint(equalToConstant: 60),
            rightButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        addSubview(select)
        select.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            select.centerXAnchor.constraint(equalTo: centerXAnchor),
            select.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 320),
            select.heightAnchor.constraint(equalToConstant: 80),
            select.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    private let titleImage: UIImageView = {
        let titleImage = UIImageView()
        titleImage.image = UIImage(named: "GTA")
        return titleImage
    }()
    
    private let title: UILabel = {
       let title = UILabel()
        title.textColor = .white
        title.font = UIFont(name: "PricedownBl-Regular", size: 60)
        title.text = "Jukebox"
        title.textAlignment = .center
        return title
    }()
    
    private let antennaImage: UIImageView = {
        let antennaImage = UIImageView()
        antennaImage.image = UIImage(named: "antenna")
        UIImageView.animate(withDuration: 0.8, delay: 0.5, options: [.repeat, .autoreverse]) {
            antennaImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
        return antennaImage
    }()
    
    private var gameSelectionImage: UIImageView = {
        let gameImage = UIImageView()
        gameImage.image = UIImage(named: "GTA3Logo")
        return gameImage
    }()
    
    private let leftButton: UIImageView = {
       let buttonImage = UIImageView()
        buttonImage.image = UIImage(systemName: "play.circle")
        buttonImage.transform = CGAffineTransform(scaleX: -1, y: 1)
        buttonImage.tintColor = .white
        return buttonImage
    }()
    
    private let rightButton: UIImageView = {
       let buttonImage = UIImageView()
        buttonImage.image = UIImage(systemName: "play.circle")
        buttonImage.tintColor = .white
        return buttonImage
    }()
    
    private let select: UIButton = {
       let selectButton = UIButton()
        selectButton.setTitle("Select", for: .normal)
        selectButton.titleLabel?.font = UIFont(name: "PricedownBl-Regular", size: 30)
        selectButton.titleLabel?.tintColor = .white
        selectButton.backgroundColor = .clear
        selectButton.layer.cornerRadius = 8
        selectButton.layer.borderWidth = 3
        selectButton.layer.borderColor = UIColor.systemGreen.cgColor
        return selectButton
    }()
    
}
