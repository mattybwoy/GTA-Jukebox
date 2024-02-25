//
//  SplashNavigationDelegate.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 25/02/2024.
//

import Foundation

protocol SplashNavigationDelegate: AnyObject {
    func toGameSelection()
}

struct SplashViewModel {
    
    let navigationDelegate: SplashNavigationDelegate
    
    func toGameSelection() {
        navigationDelegate.toGameSelection()
    }
    
}
