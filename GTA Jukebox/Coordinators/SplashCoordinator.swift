//
//  SplashCoordinator.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 24/02/2024.
//

import UIKit

final class SplashCoordinator: Coordinator {
    
    typealias Factory = SplashScreenViewControllerFactory & SelectCoordinatorFactory
    
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
        let viewController: ViewController = factory.makeSplashScreenViewController(navigationDelegate: self, onDismissed: onDismissed)
        navigator.navigate(to: viewController, transition: transition)
    }
    
}

extension SplashCoordinator: SplashNavigationDelegate, SelectNavigationDelegate {
    
    func selectButtonTapped() {
        //
    }
    
    
    func toGameSelection() {
        let coordinator = factory.makeSelectCoordinator(navigator: navigator)
        startChild(coordinator, transition: .push(animated: true), onDismissed: nil)
    }
    
}
