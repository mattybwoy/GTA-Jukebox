//
//  GenericViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 01/10/2023.
//

import UIKit

class GenericViewController<T: UIView>: BasicViewController {
    
    public var rootView: T { return view as! T }
    
    override open func loadView() {
        self.view = T()
    }
    
}
