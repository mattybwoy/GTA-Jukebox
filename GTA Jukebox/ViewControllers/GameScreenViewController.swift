//
//  GameScreenViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 08/03/2024.
//

import Foundation

final class GameScreenViewController: GenericViewController <GameView> {
    
    private let viewModel: GameViewModel
    
    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
        super.init()
        rootView.gameDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = GameView(game: viewModel.game)
    }
    
}

extension GameScreenViewController: GameScreenDelegate {
    
    func dismissScreen() {
        viewModel.dismiss()
    }
    
}
