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
        return StationLoader.gta3Stations.count - 1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
      return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        var myView = UIView(frame: CGRectMake(0, 0, pickerView.bounds.width, 20))
        var myImageView = UIImageView(frame: CGRectMake(0, 0, 80, 80))
        switch row {
        case 0:
            myImageView.image = UIImage(named: "ChatterboxFM")
        case 1:
            myImageView.image = UIImage(named:"HeadRadio")
        case 2:
            myImageView.image = UIImage(named:"DoubleClefFM")
        case 3:
            myImageView.image = UIImage(named:"K-JahRadio")
        case 4:
            myImageView.image = UIImage(named:"Rise_FM")
        case 5:
            myImageView.image = UIImage(named:"Lips106")
        case 6:
            myImageView.image = UIImage(named:"GameRadio")
        default:
            myImageView.image = UIImage(named:"MSXFM")
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
