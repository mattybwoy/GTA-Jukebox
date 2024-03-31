//
//  MusicMapper.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 13/03/2024.
//

import Foundation

struct MusicMapper {
    
    private var game: GameSelection
    
    init(game: GameSelection) {
        self.game = game
    }
    
    var radioChannelLoader: [String] {
        get {
            switch game {
            case .gta3:
                return StationLoader.gta3Stations
            case .viceCity:
                return StationLoader.viceCityStations
            case .sanAndreas:
                return StationLoader.sanAndreasStations
            }
        }
    }
    
}

