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
        viewModel.GameSelectionDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(to: rootView)
    }
    
    override func loadView() {
        self.view = SelectView()
    }
    
}

extension SelectScreenViewController: GameSelectionDelegate {
    
    func didUpdateGame(newGame: String) {
        rootView.gameSelection = viewModel.gameState
        rootView.gameSelectionImage.image = UIImage(named: newGame)
    }
    
}
