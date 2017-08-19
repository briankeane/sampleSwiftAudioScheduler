//
//  ViewController.swift
//  SampleSwiftAudioPlayer
//
//  Created by Brian D Keane on 8/19/17.
//  Copyright © 2017 Brian D Keane. All rights reserved.
//

import UIKit
import AudioKit
class ViewController: UIViewController {

    var audioPlayer:PlayolaAudioPlayer!
    var mixer:AKMixer!
    
    var song1URL:URL!
    var song2URL:URL!
    var song3URL:URL!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.audioPlayer = PlayolaAudioPlayer(identifier: "hi")
        self.mixer = AKMixer(self.audioPlayer.getOutputNode())
        AudioKit.output = self.mixer
        AudioKit.start()
        
        song1URL = Bundle.main.url(forResource: "myKind", withExtension: ".m4a")!
        song2URL = Bundle.main.url(forResource: "lonestar", withExtension: ".m4a")!
        song3URL = Bundle.main.url(forResource: "safe", withExtension: ".m4a")!
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    @IBAction func playButtonPressed(_ sender: Any)
    {
        self.audioPlayer.loadAudio(audioFileURL: self.song1URL, startTime: Date().addSeconds(5), beginFadeOutTime: Date().addSeconds(10), spinInfo: ["title":"Me and My Kind"])
        self.audioPlayer.loadAudio(audioFileURL: self.song2URL, startTime: Date().addSeconds(10), beginFadeOutTime: Date().addSeconds(15), spinInfo: ["title":"Lone Star Blues"])
        self.audioPlayer.loadAudio(audioFileURL: self.song3URL, startTime: Date().addSeconds(15), beginFadeOutTime: Date().addSeconds(20), spinInfo: ["title":"Safe as Houses"])
    }

}

