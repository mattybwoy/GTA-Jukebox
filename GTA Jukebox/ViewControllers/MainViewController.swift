//
//  MainViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 01/10/2023.
//

import UIKit

final class MainViewController: GenericViewController <MainView> {
    
    private var viewModel = MainViewModel()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(to: rootView)
    }
    
    override func loadView() {
        self.view = MainView()
    }

    enum GameSelection: String {
        case gta3 = "GTA3Logo"
        case viceCity = "ViceCityLogo"
        case sanAndreas = "SanAndreasLogo"
    }
    
}

