//
//  GameCoordinatorFactory.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 08/03/2024.
//

import Foundation

protocol GameCoordinatorFactory {
    func makeGameCoordinator(navigator: Navigator) -> Coordinator
}

extension DependencyContainer: GameCoordinatorFactory {
    func makeGameCoordinator(navigator: Navigator) -> Coordinator {
        GameCoordinator(navigator: navigator, factory: self)
    }
}
