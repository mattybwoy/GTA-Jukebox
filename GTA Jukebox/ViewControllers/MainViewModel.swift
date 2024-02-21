//
//  MainViewModel.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 15/02/2024.
//

import Foundation
import UIKit

protocol GameSelectionDelegate: AnyObject {
    func didUpdateGame(newGame: String)
}

public enum GameSelection: String {
    case gta3 = "GTA3Logo"
    case viceCity = "ViceCityLogo"
    case sanAndreas = "SanAndreasLogo"
}

final class MainViewModel: LandingScreenDelegate {
    
    init(GameSelectionDelegate: GameSelectionDelegate? = nil, gameState: GameSelection) {
        self.GameSelectionDelegate = GameSelectionDelegate
        self.gameState = gameState
    }
    
    weak var GameSelectionDelegate: GameSelectionDelegate?
    
    var gameState: GameSelection = GameSelection.gta3
    
    func bind(to view: MainView) {
        view.gameSelectionImage.image = UIImage(named: "GTA3Logo")
        view.landingDelegate = self
    }
    
    func previousGame(gameImage: String) {
        switch gameImage {
        case "SanAndreasLogo":
            gameState = GameSelection.viceCity
            GameSelectionDelegate?.didUpdateGame(newGame: GameSelection.viceCity.rawValue)
        case "ViceCityLogo":
            gameState = GameSelection.gta3
            GameSelectionDelegate?.didUpdateGame(newGame: GameSelection.gta3.rawValue)
        case "GTA3Logo":
            gameState = GameSelection.sanAndreas
            GameSelectionDelegate?.didUpdateGame(newGame: GameSelection.sanAndreas.rawValue)
        default:
            return
        }
    }
    
    func nextGame(gameImage: String) {
        switch gameImage {
        case "ViceCityLogo":
            gameState = GameSelection.sanAndreas
            GameSelectionDelegate?.didUpdateGame(newGame: GameSelection.sanAndreas.rawValue)
        case "SanAndreasLogo":
            gameState = GameSelection.gta3
            GameSelectionDelegate?.didUpdateGame(newGame: GameSelection.gta3.rawValue)
        case "GTA3Logo":
            gameState = GameSelection.viceCity
            GameSelectionDelegate?.didUpdateGame(newGame: GameSelection.viceCity.rawValue)
        default:
            return
        }
    }
    
}
