//
//  Navigator.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 24/02/2024.
//

import Foundation

public protocol Navigator: AnyObject {
    func navigate(to viewController: ViewController, transition: Transition)
    func exitFlow(coordinator: Coordinator, animated: Bool)
    func dismiss(animated: Bool)
    func popViewController(animated: Bool)
    func popToViewController(_ viewController: ViewController, animated: Bool)
    func popToRootViewController(animated: Bool)
}
