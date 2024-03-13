//
//  AudioProtocol.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 12/03/2024.
//

import AVFoundation

protocol AudioProtocol {
    var audioPlayer: AVAudioPlayer { get }
    func startRadio()
    func loadStation(station: String)
}
