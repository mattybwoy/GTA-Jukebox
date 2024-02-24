//
//  Coordinator.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 24/02/2024.
//

import Foundation

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var navigator: Navigator { set }
    var baseViewController: ViewController? { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func finish(animated: Bool)
    func start(transition: Transition, onDismissed: (() -> Void?))
    func startChild(_ child: Coordinator,
                    transition: Transition,
                    onDismissed: (() -> Void?)
    )
}
