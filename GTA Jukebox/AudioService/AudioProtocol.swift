//
//  AudioProtocol.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 12/03/2024.
//

import AVFoundation

protocol AudioProtocol {
    func startRadio()
    func loadSelectedStation(station: String)
}
