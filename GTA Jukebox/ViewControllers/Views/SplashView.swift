//
//  SplashView.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 21/02/2024.
//

import UIKit

protocol SplashScreenDelegate: AnyObject {
    func presentNextScreen()
}

final class SplashView: UIView {
    
    weak var splashDelegate: SplashScreenDelegate?
    
    public init() {
        super.init(frame: .zero)
        backgroundColor = .black
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.splashDelegate?.presentNextScreen()
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(studioImage)
        studioImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studioImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            studioImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            studioImage.heightAnchor.constraint(equalToConstant: 150),
            studioImage.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private let studioImage: UIImageView = {
        let studioImage = UIImageView()
        studioImage.image = UIImage(named: "Rockstar")
        UIImageView.animate(withDuration: 1.5, delay: 0.2, options: [.beginFromCurrentState, .transitionCrossDissolve]) {
            studioImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
        return studioImage
    }()
    
}
