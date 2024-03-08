//
//  SelectScreenViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 01/10/2023.
//

import UIKit

final class SelectScreenViewController: GenericViewController <SelectView> {
    
    private var viewModel: SelectViewModel!
    
    init(viewModel: SelectViewModel) {
        super.init()
        self.viewModel = viewModel
        viewModel.gameSelectionDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.selectDelegate = self
    }
    
    override func loadView() {
        self.view = SelectView()
    }
    
}

extension SelectScreenViewController: GameSelectionDelegate {
    
    func didUpdateGame(newGame: String) {
        rootView.gameSelection = viewModel.currentGameState
        rootView.gameSelectionImage.image = UIImage(named: newGame)
    }
    
}

extension SelectScreenViewController: SelectScreenDelegate {
    
    func previousGame(gameImage: String) {
        viewModel.previousGame(gameImage: gameImage)
    }
    
    func nextGame(gameImage: String) {
        viewModel.nextGame(gameImage: gameImage)
    }
    
    func selectTapped(gameSelected: GameSelection) {
        viewModel.selectButtonTapped(game: gameSelected)
    }
    
}
