//
//  MainViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 01/10/2023.
//

import UIKit

class MainViewController: GenericViewController <MainView> {

    override func viewDidLoad() { }
    
    override func loadView() {
        self.view = MainView()
    }


}

