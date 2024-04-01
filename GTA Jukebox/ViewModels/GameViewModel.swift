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
    private var volumeLevel = 5
    private var volumeLimit = 2..<10
    
    init(gameNavigationDelegate: GameNavigationDelegate, game: GameSelection) {
        self.gameNavigationDelegate = gameNavigationDelegate
        self.game = game
    }
    
    var updateVolume: Int {
        get {
           volumeLevel
        }
        set {
            if volumeLevel == 10 && newValue == 9 {
                volumeLevel = newValue
            }
            if volumeLevel == 1 && newValue == 2 {
                volumeLevel = newValue
            }
            if volumeLimit.contains(volumeLevel) {
                volumeLevel = newValue
            }
            print(volumeLevel)
            return
        }
    }
    
}

extension GameViewModel: GameNavigationDelegate {
    
    func dismiss() {
        gameNavigationDelegate.dismiss()
    }
    
}
