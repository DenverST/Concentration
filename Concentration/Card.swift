//
//  Card.swift
//  Concentration
//
//  Created by Denver Stove on 26/9/18.
//  Copyright © 2018 Denver Stove. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    
    var hasValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
