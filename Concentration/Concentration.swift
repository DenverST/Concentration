//
//  Concentration.swift
//  Concentration
//
//  Created by Denver Stove on 26/9/18.
//  Copyright © 2018 Denver Stove. All rights reserved.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnly: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard at \(index): chosen index not in cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnly, matchIndex != index {
//                check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
//                either no cards or two cards are face up
                indexOfOneAndOnly = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init, Must have at least one pair of cards \(numberOfPairsOfCards)")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO shuffle the cards
//        cards.shuffle()
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
