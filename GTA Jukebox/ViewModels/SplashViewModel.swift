//
//  SplashViewModel.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 04/03/2024.
//
import Foundation

public struct SplashViewModel {
    
    let splashNavigationDelegate: SplashNavigationDelegate
    
    func toGameSelection() {
        splashNavigationDelegate.toGameSelection()
    }
    
    func startRadio() {
        DispatchQueue.global(qos: .userInitiated).async {
            RadioPlayer.sharedInstance.startRadio()
        }
    }
}
