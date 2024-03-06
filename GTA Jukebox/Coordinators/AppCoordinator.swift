//
//  AppCoordinator.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 25/02/2024.
//

import UIKit

final class AppCoordinator: Coordinator {

    typealias Factory = SplashCoordinatorFactory

    var childCoordinators: [Coordinator] = []

    let navigator: Navigator
    let factory: Factory
    weak var baseViewController: ViewController?
    unowned var parentCoordinator: Coordinator?

    init(navigator: Navigator, factory: Factory) {
        self.navigator = navigator
        self.factory = factory
    }

    func start(transition: Transition, onDismissed: (() -> Void)?) {
        let navigationController = BasicNavigationController()
        navigationController.isNavigationBarHidden = true
        navigator.navigate(to: navigationController, transition: transition)
        let navigator = BasicNavigator(navigationController: navigationController)
        let splashCoordinator = factory.makeSplashCoordinator(navigator: navigator)
        startChild(splashCoordinator, transition: .push(animated: true), onDismissed: nil)
    }
    
}
