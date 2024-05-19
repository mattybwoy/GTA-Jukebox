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
    private var audioPlayer: RadioPlayer
    private var volumeLevel = 5
    private var volumeLimit = 2..<10
    
    init(gameNavigationDelegate: GameNavigationDelegate, game: GameSelection, audioPlayer: RadioPlayer) {
        self.gameNavigationDelegate = gameNavigationDelegate
        self.game = game
        self.audioPlayer = audioPlayer
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
            audioPlayer.audioPlayer.volume = Float(newValue)
            gameUpdateDelegate?.didUpdateVolume(newVolume: volumeLevel)
            return
        }
    }
    
    func startRadioStream() {
        audioPlayer.startRadio()
        audioPlayer.audioPlayer.volume = Float(volumeLevel)
    }
    
}

extension GameViewModel: GameNavigationDelegate {
    
    func dismiss() {
        gameNavigationDelegate.dismiss()
    }
    
}
