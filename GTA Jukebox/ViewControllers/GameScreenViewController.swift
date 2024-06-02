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
    private let mapper: MusicMapper
    
    init(viewModel: GameViewModel, mapper: MusicMapper) {
        self.viewModel = viewModel
        self.mapper = mapper
        super.init()
        viewModel.gameUpdateDelegate = self
        rootView.gameDelegate = self
        rootView.radioPicker.dataSource = self
        rootView.radioPicker.delegate = self
        viewModel.updateVolume = 5
        playRadioStreams()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = GameView(game: viewModel.game)
    }
    
    func playRadioStreams() {
        viewModel.startRadioStream()
    }
}

extension GameScreenViewController: GameScreenDelegate {
    
    func didTapIncreaseVolume() {
        viewModel.updateVolume += 1
    }
    
    func didTapDecreaseVolume() {
        viewModel.updateVolume -= 1
    }
    
    func dismissScreen() {
        viewModel.dismiss()
    }
    
}

extension GameScreenViewController: GameUpdateDelegate {
    
    func didUpdateVolume(newVolume: Int) {
        let volumeArray: [UIProgressView] = [rootView.volumeLevel1, rootView.volumeLevel2, rootView.volumeLevel3, rootView.volumeLevel4, rootView.volumeLevel5, rootView.volumeLevel6, rootView.volumeLevel7, rootView.volumeLevel8, rootView.volumeLevel9, rootView.volumeLevel10]
        
        for (index, volume) in volumeArray.enumerated() {
            if index < newVolume {
                volume.alpha = 1
            }
            else {
                volume.alpha = 0
            }
        }
    }
    
}

extension GameScreenViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mapper.radioChannelLoader.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
      return 150
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let myView = UIView(frame: CGRectMake(0, 0, pickerView.bounds.width, 20))
        let myImageView = UIImageView(frame: CGRectMake(0, myView.center.y - 50, 100, 100))
        let radioStationsList = mapper.radioChannelLoader
        for _ in radioStationsList {
            myImageView.image = UIImage(named: radioStationsList[row])
        }
        myImageView.contentMode = .scaleAspectFit
        myImageView.transform = CGAffineTransform(rotationAngle: GameScreenViewController.rotationAngle)
        myView.addSubview(myImageView)
        return myView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let radioStationsList = mapper.radioChannelLoader
        
        print(radioStationsList[row])
    }
}

private extension GameScreenViewController {
    static private var rotationAngle: CGFloat! = 90 * (.pi/180)
}
