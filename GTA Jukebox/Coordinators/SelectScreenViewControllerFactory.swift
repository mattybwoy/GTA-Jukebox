//
//  SelectScreenViewControllerFactory.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 28/02/2024.
//

import Foundation

protocol SelectScreenViewControllerFactory {
    func makeSelectScreenViewController(navigationDelegate: SelectNavigationDelegate, onDismissed: (() -> Void)?) -> SelectScreenViewController
}

extension DependencyContainer: SelectScreenViewControllerFactory {
    func makeSelectScreenViewController(navigationDelegate: SelectNavigationDelegate, onDismissed: (() -> Void)?) -> SelectScreenViewController {
        let selectScreenViewController = SelectScreenViewController()
        selectScreenViewController.onDismissed = onDismissed
        return selectScreenViewController
    }
}
