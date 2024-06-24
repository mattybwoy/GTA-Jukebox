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
                RadioPlayer.sharedInstance.playingStation?.volume = Float(volumeLevel)
                gameUpdateDelegate?.didUpdateVolume(newVolume: volumeLevel)
            }
            return
        }
    }
    
    func startRadioStream() -> String {
        switch game {
        case .gta3:
            return StationLoader.gta3Stations.first ?? ""
        case .viceCity:
            return StationLoader.viceCityStations.first ?? ""
        case .sanAndreas:
            return StationLoader.sanAndreasStations.first ?? ""
        }
    }
    
    func loadStation(station: String) {
        RadioPlayer.sharedInstance.loadSelectedStation(station: startRadioStream())
    }
    
}

extension GameViewModel: GameNavigationDelegate {
    
    func dismiss() {
        RadioPlayer.sharedInstance.playingStation?.setVolume(0, fadeDuration: 0.2)
        gameNavigationDelegate.dismiss()
    }
    
}
