//
//  SplashViewModel.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 04/03/2024.
//

public struct SplashViewModel {
    
    let navigationDelegate: SplashNavigationDelegate
    
    func toGameSelection() {
        navigationDelegate.toGameSelection()
    }
    
}
