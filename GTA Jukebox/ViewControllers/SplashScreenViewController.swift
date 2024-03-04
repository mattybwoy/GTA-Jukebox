//
//  SplashScreenViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 21/02/2024.
//

import UIKit

final class SplashScreenViewController: GenericViewController <SplashView>, SplashScreenDelegate, SplashNavigationDelegate {
    
    private let viewModel: SplashViewModel
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
       super.init()
        rootView.splashDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = SplashView()
    }
    
    func presentNextScreen() {
        toGameSelection()
        //let mainVC = MainViewController()
        //mainVC.modalPresentationStyle = .overFullScreen
        //self.present(mainVC, animated: true)
    }
    
    func toGameSelection() {
        viewModel.toGameSelection()
    }
    
}
