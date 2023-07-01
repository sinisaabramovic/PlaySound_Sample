//
//  ViewController.swift
//  PlaySound_Demo
//
//  Created by Sinisa Abramovic on 01.07.2023..
//  Sample AV player in Swift and UIKit

import AVFAudio
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var _playSoundButton: UIButton!
    
    private var _player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension ViewController {
    
    @IBAction func playSoundActionHandler(sender: UIButton) {
        _playSound(from: "soundEffect")
    }
    
    func _playSound(from soundSource: String) {
        // Sample taken from:
        // https://stackoverflow.com/questions/51690084/playing-audio-in-asset-library
        guard
            let audioData = NSDataAsset(name: soundSource)?.data
        else {
            fatalError("Unable to find asset \(soundSource)")
        }
                
        do {
            try AVAudioSession.sharedInstance()
                .setCategory(
                    .playback,
                    mode: .default
                )
            
            try AVAudioSession.sharedInstance()
                .setActive(true)
            
            _player = try AVAudioPlayer(data: audioData)
            guard let _player else { return }
            _player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

