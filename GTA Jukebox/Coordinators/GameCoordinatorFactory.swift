//
//  GameCoordinatorFactory.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 08/03/2024.
//

import Foundation

protocol GameCoordinatorFactory {
    func makeGameCoordinator(navigator: Navigator, game: GameSelection) -> Coordinator
}

extension DependencyContainer: GameCoordinatorFactory {
    func makeGameCoordinator(navigator: Navigator, game: GameSelection = .gta3) -> Coordinator {
        GameCoordinator(navigator: navigator, gameSelected: game, factory: self)
    }
}
