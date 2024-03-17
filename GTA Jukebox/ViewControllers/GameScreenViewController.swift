//
//  GameScreenViewController.swift
//  GTA Jukebox
//
//  Created by Matthew Lock on 08/03/2024.
//

import Foundation
import UIKit

final class GameScreenViewController: GenericViewController <GameView> {
    
    private let viewModel: GameViewModel
    
    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
        super.init()
        rootView.gameDelegate = self
        rootView.radioPicker.dataSource = self
        rootView.radioPicker.delegate = self
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

extension GameScreenViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return StationLoader.gta3Stations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return StationLoader.gta3Stations[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
      return 100
    }
}
