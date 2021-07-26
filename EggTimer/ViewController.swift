//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var timer: Timer?
    
    //minutes to second
    private let hardness = ["Soft": 5 * 60, "Medium": 7 * 60, "Hard": 12 * 60]
    

    @IBAction func click(_ sender: UIButton) {
        
        if let title = sender.currentTitle, let counter = hardness[title]{
            timer(counter: counter)
        }
    }
    
    private func timer(counter: Int) {
        
        if timer == nil {
        
            var period = counter
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { Timer in
                if period > 0 {
                    print("\(period) seconds")
                    period -= 1
                } else {
                    Timer.invalidate()
                    self.timer = nil
                }
            }
        }
    }
}
