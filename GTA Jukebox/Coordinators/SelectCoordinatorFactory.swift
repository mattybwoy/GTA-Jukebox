//
//  SelectCoordinatorFactory.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 28/02/2024.
//

import Foundation

protocol SelectCoordinatorFactory {
    func makeSelectCoordinator(navigator: Navigator) -> Coordinator
}

extension DependencyContainer: SelectCoordinatorFactory {
    func makeSelectCoordinator(navigator: Navigator) -> Coordinator {
        SelectCoordinator(navigator: navigator, factory: self)
    }
}
