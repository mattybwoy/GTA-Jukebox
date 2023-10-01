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
        return antennaImage
    }()
    
}
