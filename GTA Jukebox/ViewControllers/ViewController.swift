//
//  ViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 24/02/2024.
//

import UIKit

public protocol ViewController: AnyObject, Dismissable {
    
    var modalPresentationStyle: UIModalPresentationStyle { get set }
    var isModalInPresentation: Bool { get set }
    var presentingViewController: ViewController? { get }
    var presentedViewController: ViewController? { get }
    var presentationController: UIPresentationController? { get }
    
    func loadView()
    func viewDidLoad()
    func loadViewIfNeeded()
    func viewWillAppear(_ animated: Bool)
    func viewIsAppearing(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
    
    func show(_ vc: ViewController, sender: Any?)
    func showDetailViewController(_ vc: ViewController, sender: Any?)
    func present(_ viewControllerToPresent: ViewController, animated flag: Bool, completion: (() -> Void)?)
    func dismiss(animated flag: Bool)
}


public extension ViewController {
    
    var presentingViewController: ViewController? {
        guard let selfAsViewController = self as? UIViewController,
              let presentatingViewController = selfAsViewController.presentingViewController as? ViewController
        else {
            return nil
        }
        return presentatingViewController
    }
    
    var presentedViewController: ViewController? {
        guard let selfAsViewController = self as? UIViewController,
              let presentedViewController = selfAsViewController.presentedViewController as? ViewController
        else {
            return nil
        }
        return presentedViewController
    }
    
    var navigationController: NavigationController? {
        guard
            let selfAsViewController = self as? UIViewController,
            let navigationController = selfAsViewController.navigationController as? NavigationController
        else { return nil }

        return navigationController
    }
    
    func show(_viewController: ViewController, sender: Any?) {
        guard let selfAsUIViewController = self as? UIViewController,
              let vcAsUIViewController = _viewController as? UIViewController
        else { return }
        
        selfAsUIViewController.show(vcAsUIViewController, sender: sender)
    }
    
    func present(_ viewControllerToPresent: ViewController, animated flag: Bool, completion: (() -> Void)?) {
        guard
            let selfAsUIViewController = self as? UIViewController,
            let vcAsUIViewController = viewControllerToPresent as? UIViewController
        else { return }

        selfAsUIViewController.present(vcAsUIViewController, animated: flag, completion: completion)
    }
    
    func present(_ viewControllerToPresent: ViewController, animated flag: Bool) {
        present(viewControllerToPresent, animated: flag, completion: nil)
    }

    func dismiss(animated flag: Bool) {
        guard
            let selfAsUIViewController = self as? UIViewController
        else { return }

        selfAsUIViewController.dismiss(animated: flag, completion: nil)
    }
}
