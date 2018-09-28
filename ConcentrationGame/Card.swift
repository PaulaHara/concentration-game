//
//  Card.swift
//  ConcentrationGame
//
//  Created by paula on 2018-09-25.
//  Copyright © 2018 paula. All rights reserved.
//

import Foundation

struct Card: Hashable {
    var isFaceUp = false
    var isMatched = false
    var numFlip = 0
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getIndentifierFactory() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getIndentifierFactory()
    }
    
    // hashable protocol
    var hashValue: Int {
        return identifier
    }
    
    // equatable protocol
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    static func !=(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier != rhs.identifier
    }
}
