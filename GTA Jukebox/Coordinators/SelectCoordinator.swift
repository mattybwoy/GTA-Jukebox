//
//  SelectCoordinator.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 28/02/2024.
//

import UIKit

final class SelectCoordinator: Coordinator, SelectNavigationDelegate {
    
    typealias Factory = SelectScreenViewControllerFactory
    
    var childCoordinators: [Coordinator] = []
    var navigator: Navigator
    var baseViewController: ViewController?
    var parentCoordinator: Coordinator?
    let factory: Factory
    
    init(navigator: Navigator, factory: Factory) {
        self.navigator = navigator
        self.factory = factory
    }
    
    func start(transition: Transition, onDismissed: (() -> Void)?) {
        let viewController: ViewController = factory.makeSelectScreenViewController(navigationDelegate: self, onDismissed: onDismissed)
        baseViewController = viewController
        navigator.navigate(to: viewController, transition: transition)
    }
}

extension SelectCoordinator {
    
    func toGameSelection() {
        //TODO
    }
}
