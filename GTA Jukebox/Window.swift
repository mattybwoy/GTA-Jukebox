//
//  Window.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 25/02/2024.
//

import UIKit

public protocol Window: AnyObject {
    var rootViewController: ViewController? { get set }

    func makeKeyAndVisible()
}

public extension Window {
    var rootViewController: ViewController? {
        get {
            guard
                let selfAsUIWindow = self as? UIWindow,
                let rootViewController = selfAsUIWindow.rootViewController as? ViewController
            else { return nil }

            return rootViewController
        }

        set {
            guard
                let selfAsUIWindow = self as? UIWindow,
                let rootViewControllerToSet = newValue as? UIViewController
            else { return }

            selfAsUIWindow.rootViewController = rootViewControllerToSet
        }
    }
}

extension UIWindow: Window {}
