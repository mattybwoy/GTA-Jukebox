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
        let path = Bundle.main.url(forResource: "flash_fm", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: path!)
            audioPlayer.play()
            audioPlayer.numberOfLoops = -1
        } catch {
            print(LocalizedError.self)
        }
    }
    
    func loadSelectedStation(station: String) {
    }
    
}
