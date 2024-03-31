//
//  SelectScreenViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 01/10/2023.
//

import UIKit

final class SelectScreenViewController: GenericViewController <SelectView> {
    
    private var viewModel: SelectViewModel
    
    init(viewModel: SelectViewModel) {
        self.viewModel = viewModel
        super.init()
        viewModel.gameSelectionDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.selectDelegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        rootView.antennaImage.transform = .identity
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateAntenna()
    }
    
    override func loadView() {
        self.view = SelectView()
    }
    
    func animateAntenna() {
        DispatchQueue.main.async {
            UIImageView.animate(withDuration: 0.8, delay: 0.5, options: [.repeat, .autoreverse]) {
                self.rootView.antennaImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
        }
    }
    
}

extension SelectScreenViewController: GameSelectionDelegate {
    
    func didUpdateGame(newGame: String) {
        rootView.gameSelection = viewModel.currentGameState
        rootView.gameSelectionImage.image = UIImage(named: newGame + "Logo")
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
