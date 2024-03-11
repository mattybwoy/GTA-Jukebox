//
//  GameCoordinator.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 08/03/2024.
//

import Foundation

final class GameCoordinator: Coordinator {
    
    typealias Factory = GameScreenViewControllerFactory
    
    var childCoordinators: [Coordinator] = []
    let navigator: Navigator
    let factory: Factory
    weak var baseViewController: ViewController?
    unowned var parentCoordinator: Coordinator?
    let gameSelected: GameSelection
    
    init(navigator: Navigator, gameSelected: GameSelection, factory: Factory) {
        self.navigator = navigator
        self.gameSelected = gameSelected
        self.factory = factory
    }
    
    func start(transition: Transition, onDismissed: (() -> Void)?) {
        let viewController: ViewController = factory.makeGameScreenViewController(navigationDelegate: self, gameSelected: gameSelected, onDismissed: onDismissed)
        navigator.navigate(to: viewController, transition: transition)
    }
    
}

extension GameCoordinator: GameNavigationDelegate {
    
    func dismiss() {
        navigator.popViewController(animated: true)
    }
    
}
