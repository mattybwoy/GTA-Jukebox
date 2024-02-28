//
//  SelectScreenViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 01/10/2023.
//

import UIKit

final class SelectScreenViewController: GenericViewController <MainView>, GameSelectionDelegate {
    
    private var viewModel = MainViewModel(gameState: .gta3)
    
    override init() {
        super.init()
        viewModel.GameSelectionDelegate = self
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
