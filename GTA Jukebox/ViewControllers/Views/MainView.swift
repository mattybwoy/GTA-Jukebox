//
//  MainView.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 01/10/2023.
//

import UIKit

protocol LandingScreenDelegate: AnyObject {
    func previousGame()
    func nextGame()
}

final class MainView: UIView {

    weak var landingDelegate: LandingScreenDelegate?
    
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
            titleImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -270),
            titleImage.heightAnchor.constraint(equalToConstant: 200),
            titleImage.widthAnchor.constraint(equalToConstant: 280)
        ])
        
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -145),
            title.heightAnchor.constraint(equalToConstant: 100),
            title.widthAnchor.constraint(equalToConstant: 240)
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
    
    private var leftButton: UIButton = {
        let leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        var leftConfig = UIButton.Configuration.plain()
        leftConfig.image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.applyingSymbolConfiguration(.init(pointSize: 35))
        leftConfig.contentInsets = .zero
        leftButton.configuration = leftConfig
        leftButton.contentVerticalAlignment = .fill
        leftButton.contentHorizontalAlignment = .fill
        leftButton.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        leftButton.addTarget(self, action: #selector(previousGame), for: .touchUpInside)
        leftButton.tintColor = .white
        return leftButton
    }()
    
    private var rightButton: UIButton = {
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        var rightConfig = UIButton.Configuration.plain()
        rightConfig.image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(scale: .large))?.applyingSymbolConfiguration(.init(pointSize: 35))
        rightConfig.contentInsets = .zero
        rightButton.configuration = rightConfig
        rightButton.contentVerticalAlignment = .fill
        rightButton.contentHorizontalAlignment = .fill
        rightButton.addTarget(self, action: #selector(nextGame), for: .touchUpInside)
        rightButton.tintColor = .white
        return rightButton
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
    
    @objc func previousGame() {
        landingDelegate?.previousGame()
    }
    
    @objc func nextGame() {
        landingDelegate?.nextGame()
    }
    
}
