//
//  GameViewModel.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 08/03/2024.
//

import Foundation

final class GameViewModel {
    
    let gameNavigationDelegate: GameNavigationDelegate
    
    init(gameNavigationDelegate: GameNavigationDelegate) {
        self.gameNavigationDelegate = gameNavigationDelegate
    }
    
}
