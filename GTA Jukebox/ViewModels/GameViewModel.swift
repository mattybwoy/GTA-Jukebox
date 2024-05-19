//
//  GameViewModel.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 08/03/2024.
//

import Foundation

protocol GameUpdateDelegate: AnyObject {
    func didUpdateVolume(newVolume: Int)
}

final class GameViewModel {
    
    weak var gameUpdateDelegate: GameUpdateDelegate?
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
                gameUpdateDelegate?.didUpdateVolume(newVolume: volumeLevel)
            }
            if volumeLevel == 1 && newValue == 2 {
                volumeLevel = newValue
                gameUpdateDelegate?.didUpdateVolume(newVolume: volumeLevel)
            }
            if volumeLimit.contains(volumeLevel) {
                volumeLevel = newValue
                gameUpdateDelegate?.didUpdateVolume(newVolume: volumeLevel)
            }
            return
        }
    }
    
}

extension GameViewModel: GameNavigationDelegate {
    
    func dismiss() {
        gameNavigationDelegate.dismiss()
    }
    
}
