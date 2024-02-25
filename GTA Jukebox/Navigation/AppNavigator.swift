//
//  AppNavigator.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 25/02/2024.
//

import Foundation

final class AppNavigator: Navigator {
    
    private let window: Window
    
    init(window: Window) {
        self.window = window
    }
    
    func navigate(to viewController: ViewController, transition: Transition) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    func exitFlow(coordinator: Coordinator, animated: Bool) {
        fatalError("shouldn't exit")
    }
    
    func dismiss(animated: Bool) {
        fatalError("shouldn't dismiss")
    }
    
    func popViewController(animated: Bool) {
        fatalError("shouldn't pop")
    }
    
    func popToViewController(_ viewController: ViewController, animated: Bool) {
        fatalError("shouldn't pop")
    }
    
    func popToRootViewController(animated: Bool) {
        fatalError("shouldn't pop")
    }
    
}
