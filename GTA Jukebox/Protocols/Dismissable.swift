//
//  Dismissable.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 24/02/2024.
//

import Foundation

public protocol Dismissable {
    var onDismissed: (() -> Void)? { get set }
}
