//
//  RadioPlayer.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 13/03/2024.
//

import Foundation
import AVFoundation

final class RadioPlayer: AudioProtocol {
    
    static let sharedInstance = RadioPlayer()
    var playingStation: String = ""
    private var allStations = [String: AVAudioPlayer]()
    
    func startRadio() {
        let gta3 = StationLoader.gta3Stations
        let viceCity = StationLoader.viceCityStations
        let sanAn = StationLoader.sanAndreasStations
        let radioStations: [String] = gta3 + viceCity + sanAn

        for radioStation in radioStations {
            let path = Bundle.main.url(forResource: radioStation.lowercased(), withExtension: "mp3")
            do {
                var audioPlayer = AVAudioPlayer()
                audioPlayer = try AVAudioPlayer(contentsOf: path!)
                audioPlayer.play()
                audioPlayer.volume = 0
                audioPlayer.numberOfLoops = -1
                allStations.updateValue(audioPlayer, forKey: radioStation)
            } catch {
                print(LocalizedError.self)
            }
        }
        print(allStations)
    }
    
    func loadSelectedStation(station: String) {
        playingStation = station
        let radioChannel = allStations[station]
        radioChannel?.volume = 5
    }
    
}
