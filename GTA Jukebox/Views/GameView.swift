//
//  GameView.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 08/03/2024.
//

import UIKit

protocol GameScreenDelegate: AnyObject {
    func dismissScreen()
}

final class GameView: UIView {
    
    weak var gameDelegate: GameScreenDelegate?
    let gameSelected: GameSelection
    
    public init(game: GameSelection) {
        self.gameSelected = game
        super.init(frame: .zero)
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(gameLogoImage)
        gameLogoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameLogoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameLogoImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            gameLogoImage.heightAnchor.constraint(equalToConstant: 150),
            gameLogoImage.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        addSubview(radioStationImage)
        radioStationImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            radioStationImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            radioStationImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 150),
            radioStationImage.heightAnchor.constraint(equalToConstant: 100),
            radioStationImage.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        addSubview(gameBackground)
        gameBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameBackground.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -210),
            gameBackground.heightAnchor.constraint(equalToConstant: 320),
            gameBackground.widthAnchor.constraint(equalToConstant: bounds.width)
        ])
        
        addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -130),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -340),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    private lazy var gameLogoImage: UIImageView = {
        let gameImage = UIImageView()
        gameImage.image = UIImage(named: gameSelected.rawValue + "Logo")
        gameImage.contentMode = .scaleAspectFit
        return gameImage
    }()
    
    private lazy var radioStationImage: UIImageView = {
        let radioStationImage = UIImageView()
        radioStationImage.image = UIImage(named: "ChatterboxFM")
        radioStationImage.contentMode = .scaleAspectFit
        return radioStationImage
    }()
    
    private lazy var gameBackground: UIImageView = {
        let gameBackgroundImage = UIImageView()
        gameBackgroundImage.image = UIImage(named: gameSelected.rawValue + "Loading")
        gameBackgroundImage.contentMode = .scaleAspectFit
        return gameBackgroundImage
    }()
    
    private let backButton: UIButton = {
        let backButton = UIButton()
         backButton.setTitle("Back", for: .normal)
         backButton.titleLabel?.font = UIFont(name: "PricedownBl-Regular", size: 25)
         backButton.setTitleColor(.black, for: .normal)
         backButton.backgroundColor = .darkGray
         backButton.layer.cornerRadius = 8
         backButton.layer.borderWidth = 3
         backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
         return backButton
    }()
    
    @objc func backButtonTapped() {
        gameDelegate?.dismissScreen()
    }
    
}
