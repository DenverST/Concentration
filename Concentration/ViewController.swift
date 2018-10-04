//
//  ViewController.swift
//  Concentration
//
//  Created by Denver Stove on 25/9/18.
//  Copyright © 2018 Denver Stove. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count / 2)
    }
        
    private(set) var flipCount = 0 {
        didSet {
            flippingCount.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flippingCount: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    @IBOutlet weak var newGameButton: UIButton! {
        didSet {
            newGameButton.titleLabel?.numberOfLines = 0
        }
    }
    
    
    @IBAction func onNewGame(_ sender: UIButton) {
        restartGame()
    }
    
    func restartGame() {
        game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
        flippingCount.text = "Flips: \(flipCount)"
        emoji = [:]
    }

    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            upDateViewFromModel()
        }
    }
    
    private func upDateViewFromModel() {
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
        
    private var emojiChoices = ["🤯", "🤫", "😎", "😈", "🐏", "🍵", "🥟", "🎺", "🏩", "⌛️"]
    
    private var emoji = [Int:String]()
        
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
            }
        return emoji[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}


