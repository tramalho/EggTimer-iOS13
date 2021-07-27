//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    private var timer: Timer = Timer()
    
    private lazy var player: AVAudioPlayer = {
      
        var player = AVAudioPlayer()
        
        if let resource = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") {
            player = try! AVAudioPlayer(contentsOf: resource)
        }
       
        return player
    }()
    
    private var remainingTime = 0
    
    //minutes to second
    private let hardness = ["Soft": 3, "Medium": 7, "Hard": 12]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
    }
    
    @IBAction func click(_ sender: UIButton) {
        
        if let title = sender.currentTitle, let counter = hardness[title]{
            timer(counter: counter)
        }
    }
    
    private func timer(counter: Int) {
                
        timer.invalidate()
        player.stop()
        progressBar.progress = 0
        remainingTime = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { Timer in
            if self.remainingTime <= counter {
                let progress = Float(self.remainingTime) / Float(counter)
                self.progressBar.progress = progress
                print("\(progress) progress")
                self.remainingTime += 1
            } else {
                self.player.play()
                self.timer.invalidate()
            }
        }
    }
}
