//
//  Transition.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 24/02/2024.
//

public enum Transition: Equatable {
    case push(animated: Bool)
    case modal(animated: Bool)
}
