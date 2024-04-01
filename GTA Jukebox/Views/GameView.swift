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
        
        addSubview(gameBackground)
        gameBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameBackground.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -210),
            gameBackground.heightAnchor.constraint(equalToConstant: 320),
            gameBackground.widthAnchor.constraint(equalToConstant: bounds.width)
        ])
        
        addSubview(radioPicker)
        radioPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            radioPicker.centerXAnchor.constraint(equalTo: centerXAnchor),
            radioPicker.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 140),
            radioPicker.heightAnchor.constraint(equalToConstant: bounds.width),
            radioPicker.widthAnchor.constraint(equalToConstant: 100)
        ])
        addSubview(volumeLabel)
        volumeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            volumeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            volumeLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 320),
            volumeLabel.heightAnchor.constraint(equalToConstant: 70),
            volumeLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        addSubview(decreaseVolume)
        decreaseVolume.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            decreaseVolume.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -130),
            decreaseVolume.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 250),
            decreaseVolume.heightAnchor.constraint(equalToConstant: 60),
            decreaseVolume.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        addSubview(increaseVolume)
        increaseVolume.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            increaseVolume.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 130),
            increaseVolume.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 250),
            increaseVolume.heightAnchor.constraint(equalToConstant: 60),
            increaseVolume.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        addSubview(volumeLevel1)
        volumeLevel1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            volumeLevel1.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -70),
            volumeLevel1.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 250),
            volumeLevel1.heightAnchor.constraint(equalToConstant: 5),
            volumeLevel1.widthAnchor.constraint(equalToConstant: 10)
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
    
    var radioPicker: UIPickerView = {
        let radioPicker = UIPickerView()
        radioPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        radioPicker.backgroundColor = .darkGray
        return radioPicker
    }()
    
    private let volumeLabel: UILabel = {
       let volumeLabel = UILabel()
        volumeLabel.textColor = .white
        volumeLabel.font = UIFont(name: "PricedownBl-Regular", size: 30)
        volumeLabel.text = "Volume"
        return volumeLabel
    }()
    
    private let decreaseVolume: UIButton = {
        let decrease = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        var decreaseConfig = UIButton.Configuration.plain()
        decreaseConfig.image = UIImage(systemName: "speaker.minus.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.applyingSymbolConfiguration(.init(pointSize: 25))
        decreaseConfig.contentInsets = .zero
        decrease.configuration = decreaseConfig
        decrease.contentVerticalAlignment = .fill
        decrease.contentHorizontalAlignment = .fill
        decrease.tintColor = .white
        return decrease
    }()
    
    private let increaseVolume: UIButton = {
        let increase = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        var increaseConfig = UIButton.Configuration.plain()
        increaseConfig.image = UIImage(systemName: "speaker.plus.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.applyingSymbolConfiguration(.init(pointSize: 25))
        increaseConfig.contentInsets = .zero
        increase.configuration = increaseConfig
        increase.contentVerticalAlignment = .fill
        increase.contentHorizontalAlignment = .fill
        increase.tintColor = .white
        return increase
    }()
    
    private let volumeLevel1: UIProgressView = {
        let volumeLevel = UIProgressView(progressViewStyle: .bar)
        volumeLevel.trackTintColor = .clear
        volumeLevel.progressTintColor = .systemPink
        volumeLevel.transform = CGAffineTransform(rotationAngle: rotationAngle)
        volumeLevel.transform = CGAffineTransformMakeScale(1, 2)
        volumeLevel.setProgress(100, animated: false)
        return volumeLevel
    }()
    
    @objc func backButtonTapped() {
        gameDelegate?.dismissScreen()
    }
    
}

extension GameView {
    static private var rotationAngle: CGFloat! = -90 * (.pi/180)
}
