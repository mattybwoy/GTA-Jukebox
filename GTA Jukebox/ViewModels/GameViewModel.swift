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
    private var volumeLimit = 0...10
    
    init(gameNavigationDelegate: GameNavigationDelegate, game: GameSelection) {
        self.gameNavigationDelegate = gameNavigationDelegate
        self.game = game
    }
    
    var updateVolume: Int {
        get {
           volumeLevel
        }
        set(newVolume) {
            if volumeLimit.contains(newVolume) {
                volumeLevel = newVolume
                //audioPlayer.audioPlayer.volume = Float(newVolume)
                gameUpdateDelegate?.didUpdateVolume(newVolume: volumeLevel)
            }
            return
        }
    }
    
    func startRadioStream() {

        //audioPlayer.audioPlayer.volume = Float(volumeLevel)
    }
    
}

extension GameViewModel: GameNavigationDelegate {
    
    func dismiss() {
        gameNavigationDelegate.dismiss()
    }
    
}
