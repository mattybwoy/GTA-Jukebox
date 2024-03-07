//
//  SelectViewModel.swift
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

final class SelectViewModel {
    
    let selectNavigationDelegate: SelectNavigationDelegate
    weak var gameSelectionDelegate: GameSelectionDelegate?
    var gameState: GameSelection = GameSelection.gta3
    
    init(selectNavigationDelegate: SelectNavigationDelegate) {
        self.selectNavigationDelegate = selectNavigationDelegate
    }
    
    func previousGame(gameImage: String) {
        switch gameImage {
        case "SanAndreasLogo":
            gameState = GameSelection.viceCity
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.viceCity.rawValue)
        case "ViceCityLogo":
            gameState = GameSelection.gta3
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.gta3.rawValue)
        case "GTA3Logo":
            gameState = GameSelection.sanAndreas
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.sanAndreas.rawValue)
        default:
            return
        }
    }
    
    func nextGame(gameImage: String) {
        switch gameImage {
        case "ViceCityLogo":
            gameState = GameSelection.sanAndreas
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.sanAndreas.rawValue)
        case "SanAndreasLogo":
            gameState = GameSelection.gta3
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.gta3.rawValue)
        case "GTA3Logo":
            gameState = GameSelection.viceCity
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.viceCity.rawValue)
        default:
            return
        }
    }
    
}

extension SelectViewModel: SelectNavigationDelegate {
    
    func selectButtonTapped(game: GameSelection) {
        //Should navigate to next screen
        print(game.rawValue)
    }
    
}
