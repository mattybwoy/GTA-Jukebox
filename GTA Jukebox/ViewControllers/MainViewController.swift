//
//  MainViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 01/10/2023.
//

import UIKit

final class MainViewController: GenericViewController <MainView>, GameSelectionDelegate {
    
    private var viewModel = MainViewModel(gameState: .gta3)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel.GameSelectionDelegate = self
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
    
    func didUpdateGame(newGame: String) {
        rootView.gameSelection = viewModel.gameState
        rootView.gameSelectionImage.image = UIImage(named: newGame)
    }
    
}

