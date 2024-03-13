//
//  RadioPlayer.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 13/03/2024.
//

import Foundation
import AVFoundation

final class RadioPlayer: AudioProtocol {
    
    var audioPlayer: AVAudioPlayer
    
    init(audioPlayer: AVAudioPlayer) {
        self.audioPlayer = audioPlayer
    }
    
    func startRadio() {
        let path = Bundle.main.path(forResource: "example.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
    }

    func loadStation(station: String) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(string: station)!)
            audioPlayer.play()
        } catch {
            print(LocalizedError.self)
        }
    }

    
}
