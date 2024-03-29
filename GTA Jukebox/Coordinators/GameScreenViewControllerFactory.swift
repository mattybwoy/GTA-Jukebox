//
//  GameScreenViewControllerFactory.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 08/03/2024.
//

import Foundation

protocol GameScreenViewControllerFactory {
    func makeGameScreenViewController(navigationDelegate: GameNavigationDelegate, gameSelected: GameSelection, onDismissed: (() -> Void)?) -> GameScreenViewController
}

extension DependencyContainer: GameScreenViewControllerFactory {
    
    func makeGameScreenViewController(navigationDelegate: GameNavigationDelegate, gameSelected: GameSelection, onDismissed: (() -> Void)?) -> GameScreenViewController {
        let GameViewModel = GameViewModel(gameNavigationDelegate: navigationDelegate, game: gameSelected)
        let GameScreenViewController = GameScreenViewController(viewModel: GameViewModel)
        GameScreenViewController.onDismissed = onDismissed
        return GameScreenViewController
    }
}
