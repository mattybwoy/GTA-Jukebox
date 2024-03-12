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
    case gta3 = "GTA3"
    case viceCity = "ViceCity"
    case sanAndreas = "SanAndreas"
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
        case "SanAndreas":
            currentGameState = .viceCity
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.viceCity.rawValue)
        case "ViceCity":
            currentGameState = .gta3
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.gta3.rawValue)
        case "GTA3":
            currentGameState = .sanAndreas
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.sanAndreas.rawValue)
        default:
            return
        }
    }
    
    func nextGame(gameImage: String) {
        switch gameImage {
        case "ViceCity":
            currentGameState = .sanAndreas
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.sanAndreas.rawValue)
        case "SanAndreas":
            currentGameState = .gta3
            gameSelectionDelegate?.didUpdateGame(newGame: GameSelection.gta3.rawValue)
        case "GTA3":
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
