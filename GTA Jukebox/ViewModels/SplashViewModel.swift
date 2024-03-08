//
//  SplashViewModel.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 04/03/2024.
//

public struct SplashViewModel {
    
    let splashNavigationDelegate: SplashNavigationDelegate
    
    func toGameSelection() {
        splashNavigationDelegate.toGameSelection()
    }
    
}
