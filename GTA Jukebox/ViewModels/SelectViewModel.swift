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

enum GameSelection: String {
    case gta3 = "GTA3Logo"
    case viceCity = "ViceCityLogo"
    case sanAndreas = "SanAndreasLogo"
}

final class SelectViewModel {
    
    let selectNavigationDelegate: SelectNavigationDelegate
    weak var gameSelectionDelegate: GameSelectionDelegate?
    private var gameState: GameSelection = GameSelection.gta3
    
    init(selectNavigationDelegate: SelectNavigationDelegate) {
        self.selectNavigationDelegate = selectNavigationDelegate
    }
    
    public var currentGameState: GameSelection {
        get {
            return gameState
        }
        set {
            self.gameState = newValue
        }
    }
    
    func previousGame(gameImage: String) {
        switch gameImage {
        case "SanAndreasLogo":
            currentGameState = .viceCity
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.viceCity.rawValue)
        case "ViceCityLogo":
            currentGameState = .gta3
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.gta3.rawValue)
        case "GTA3Logo":
            currentGameState = .sanAndreas
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.sanAndreas.rawValue)
        default:
            return
        }
    }
    
    func nextGame(gameImage: String) {
        switch gameImage {
        case "ViceCityLogo":
            currentGameState = .sanAndreas
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.sanAndreas.rawValue)
        case "SanAndreasLogo":
            currentGameState = .gta3
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.gta3.rawValue)
        case "GTA3Logo":
            currentGameState = .viceCity
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.viceCity.rawValue)
        default:
            return
        }
    }
    
}

extension SelectViewModel: SelectNavigationDelegate {
    
    func selectButtonTapped(game: GameSelection) {
        selectNavigationDelegate.selectButtonTapped(game: game)
    }
    
}
