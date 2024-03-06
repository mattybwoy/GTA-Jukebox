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

final class SelectViewModel: SelectScreenDelegate {
    
    let selectNavigationDelegate: SelectNavigationDelegate
    weak var GameSelectionDelegate: GameSelectionDelegate?
    var gameState: GameSelection = GameSelection.gta3
    
    init(GameSelectionDelegate: GameSelectionDelegate? = nil, gameState: GameSelection = .gta3, selectNavigationDelegate: SelectNavigationDelegate) {
        self.GameSelectionDelegate = GameSelectionDelegate
        self.gameState = gameState
        self.selectNavigationDelegate = selectNavigationDelegate
    }
    
    func bind(to view: SelectView) {
        view.gameSelectionImage.image = UIImage(named: "GTA3Logo")
        view.selectDelegate = self
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

extension SelectViewModel: SelectNavigationDelegate {
    
    func selectButtonTapped() {
        //Should navigate to next screen
        print(gameState.rawValue)
    }
    
}
