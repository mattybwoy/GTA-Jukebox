//
//  GameViewModel.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 08/03/2024.
//

import Foundation

final class GameViewModel {
    
    let gameNavigationDelegate: GameNavigationDelegate
    let game: GameSelection
    
    init(gameNavigationDelegate: GameNavigationDelegate, game: GameSelection) {
        self.gameNavigationDelegate = gameNavigationDelegate
        self.game = game
    }
    
}

extension GameViewModel: GameNavigationDelegate {
    
    func dismiss() {
        gameNavigationDelegate.dismiss()
    }
    
}
