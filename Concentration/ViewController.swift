//
//  ViewController.swift
//  Concentration
//
//  Created by Denver Stove on 25/9/18.
//  Copyright © 2018 Denver Stove. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "🚀", on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.9768045545, blue: 0.6977539062, alpha: 1)
        }
    }
    
}

