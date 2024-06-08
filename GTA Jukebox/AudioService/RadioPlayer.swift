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

   private var allStations = [AVAudioPlayer]()
    
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
                allStations.append(audioPlayer)
            } catch {
                print(LocalizedError.self)
            }
        }
        print(allStations)
    }
    
    func loadSelectedStation(station: String) {
        
    }
    
}
