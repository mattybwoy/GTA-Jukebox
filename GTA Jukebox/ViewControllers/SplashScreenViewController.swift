//
//  SplashScreenViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 21/02/2024.
//

import UIKit

final class SplashScreenViewController: GenericViewController <SplashView>, SplashScreenDelegate {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        rootView.splashDelegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = SplashView()
    }
    
    func presentNextScreen() {
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .overFullScreen
        self.present(mainVC, animated: true)
    }
    
}
