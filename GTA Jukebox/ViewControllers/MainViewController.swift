//
//  MainViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 01/10/2023.
//

import UIKit

final class MainViewController: GenericViewController <MainView>, LandingScreenDelegate {

    override func viewDidLoad() {
        rootView.landingDelegate = self
    }
    
    override func loadView() {
        self.view = MainView()
    }

    enum GameSelection: String {
        case gta3 = "GTA3Logo"
        case viceCity = "ViceCityLogo"
        case sanAndreas = "SanAndreasLogo"
    }
    
    func previousGame() {
        print("hello")
    }
    
    func nextGame() {
        print("goodbye")
    }

}

