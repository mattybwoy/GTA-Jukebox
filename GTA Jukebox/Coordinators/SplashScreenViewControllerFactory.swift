//
//  SplashScreenViewControllerFactory.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 25/02/2024.
//

import Foundation

protocol SplashScreenViewControllerFactory {
    func makeSplashScreenViewController(navigationDelegate: SplashNavigationDelegate, onDismissed: (() -> Void)?) -> SplashScreenViewController
}

extension DependencyContainer: SplashScreenViewControllerFactory {
    func makeSplashScreenViewController(navigationDelegate: SplashNavigationDelegate, onDismissed: (() -> Void)?) -> SplashScreenViewController {
        let splashViewModel = SplashViewModel(splashNavigationDelegate: navigationDelegate)
        let radioPlayer = RadioPlayer()
        let splashScreenViewController = SplashScreenViewController(viewModel: splashViewModel)
        splashScreenViewController.onDismissed = onDismissed
        return splashScreenViewController
    }
}
