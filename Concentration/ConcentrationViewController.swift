//
//  ViewController.swift
//  Concentration
//
//  Created by Denver Stove on 25/9/18.
//  Copyright © 2018 Denver Stove. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count / 2)
    }
        
    private(set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key:Any] = [.strokeWidth : 5.0, .strokeColor : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flippingCount.attributedText = attributedString
    }
    
    @IBOutlet private weak var flippingCount: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
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
        flipCount = 0
        flippingCount.text = "Flips: \(flipCount)"
        emoji = [:]
        emojiChoices = theme ?? ""
        upDateViewFromModel()
    }
    
    
    // how does this line stop the random ?? error
//    override func viewDidLoad() {
//        restartGame()
//    }
    // the answer was not to set the game with the number of paids of cards to equal the count of card buttons + 1 then divided by two

    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            upDateViewFromModel()
        }
    }
    
    private func upDateViewFromModel() {
        if cardButtons != nil {
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
    }
    
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            upDateViewFromModel()
        }
    }
    private var emojiChoices = "🤯🤫😎😈🐏🍵🥟🎺🏩⌛️"
    
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
            }
        return emoji[card] ?? "?"
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
