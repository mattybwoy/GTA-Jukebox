//
//  SplashScreenViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 21/02/2024.
//

import UIKit

final class SplashScreenViewController: GenericViewController <SplashView> {
    
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
    
}

extension SplashScreenViewController: SplashScreenDelegate {
    
    func presentNextScreen() {
        viewModel.toGameSelection()
    }
    
}
