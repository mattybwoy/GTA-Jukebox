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
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
      return 150
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let myView = UIView(frame: CGRectMake(0, 0, pickerView.bounds.width, 20))
        let myImageView = UIImageView(frame: CGRectMake(0, myView.center.y - 50, 100, 100))
        for _ in StationLoader.gta3Stations {
            myImageView.image = UIImage(named: StationLoader.gta3Stations[row])
        }
        myImageView.contentMode = .scaleAspectFit
        myImageView.transform = CGAffineTransform(rotationAngle: GameScreenViewController.rotationAngle)
        myView.addSubview(myImageView)
        return myView
    }
}

extension GameScreenViewController {
    static private var rotationAngle: CGFloat! = 90 * (.pi/180)
}
