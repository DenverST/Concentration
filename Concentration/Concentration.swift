//
//  Concentration.swift
//  Concentration
//
//  Created by Denver Stove on 26/9/18.
//  Copyright © 2018 Denver Stove. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO shuffle the cards
        cards.shuffle()
    }
}
