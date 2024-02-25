//
//  SplashCoordinatorFactory.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 24/02/2024.
//

import Foundation

protocol SplashCoordinatorFactory {
    func makeSplashCoordinator(navigator: Navigator) -> Coordinator
}

extension DependencyContainer: SplashCoordinatorFactory {
    func makeSplashCoordinator(navigator: Navigator) -> Coordinator {
        SplashCoordinator(navigator: navigator, factory: self)
    }
}
