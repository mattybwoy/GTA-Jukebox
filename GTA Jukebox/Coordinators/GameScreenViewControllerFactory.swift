//
//  GameScreenViewControllerFactory.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 08/03/2024.
//

import Foundation

protocol GameScreenViewControllerFactory {
    func makeGameScreenViewController(navigationDelegate: GameNavigationDelegate, onDismissed: (() -> Void)?) -> GameScreenViewController
}

extension DependencyContainer: GameScreenViewControllerFactory {
    
    func makeGameScreenViewController(navigationDelegate: GameNavigationDelegate, onDismissed: (() -> Void)?) -> GameScreenViewController {
        let GameViewModel = GameViewModel(gameNavigationDelegate: navigationDelegate)
        let GameScreenViewController = GameScreenViewController(viewModel: GameViewModel)
        GameScreenViewController.onDismissed = onDismissed
        return GameScreenViewController
    }
}
