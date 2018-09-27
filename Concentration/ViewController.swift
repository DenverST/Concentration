//
//  ViewController.swift
//  Concentration
//
//  Created by Denver Stove on 25/9/18.
//  Copyright © 2018 Denver Stove. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count / 2)
    }
        
    var flipCount = 0 {
        didSet {
            flippingCount.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flippingCount: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func restartButton(_ sender: UIButton) {
        restartGame()
    }
    
    func restartGame() {
        game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
        flippingCount.text = "Flips: \(flipCount)"
    }

    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            upDateViewFromModel()
        }
    }
    
    func upDateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.9768045545, blue: 0.6977539062, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1)
            }
        }
    }
        
    var emojiChoices = ["🤯", "🤫", "😎", "😈", "🐏", "🍵", "🥟", "🎺", "🏩", "⌛️"]
    
    var emoji = [Int:String]()
        
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int (arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        
        return emoji[card.identifier] ?? "?"
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
    }
}

//    func flipCard(withEmoji emoji: String, on button: UIButton) {
//        if button.currentTitle == emoji {
//            button.setTitle("", for: UIControl.State.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1)
//        } else {
//            button.setTitle(emoji, for: UIControl.State.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.9768045545, blue: 0.6977539062, alpha: 1)
//        }
//    }


