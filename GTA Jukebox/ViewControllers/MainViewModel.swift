//
//  MainViewModel.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 15/02/2024.
//

import Foundation
import UIKit

final class MainViewModel: LandingScreenDelegate {
    
    func bind(to view: MainView) {
        view.landingDelegate = self
    }
    
    func previousGame() {
        print("hello")
    }
    
    func nextGame() {
        print("goodbye")
    }
}
