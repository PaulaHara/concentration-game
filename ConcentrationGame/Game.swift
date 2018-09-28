//
//  Game.swift
//  ConcentrationGame
//
//  Created by paula on 2018-09-25.
//  Copyright © 2018 paula. All rights reserved.
//

import Foundation

struct Game {
    
    private(set) var cards = [Card]()
    private(set) var score = 0
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.ondeAndOnly
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil{
//                        foundIndex = index
//                    }else{
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfPairOfCards: Int){
        // if this conditions is false, an exception will be thrown with this msg
        assert(numberOfPairOfCards > 0, "Game.init(\(numberOfPairOfCards)): must have at least one pair of cards")
        
        for _ in 1...numberOfPairOfCards{
            let card = Card()
            self.cards += [card, card]
        }
        self.cards.shuffle()
    }
    
    mutating func chooseCard(at index: Int) {
        // if this conditions is false, an exception will be thrown with this msg
        assert(cards.indices.contains(index), "Game.chooseCard(\(index)): the chosen index does not exist in cards")
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[index] == cards[matchIndex] {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                    self.score = 2
                }else{
                    self.score = -1
                }
                cards[index].isFaceUp = true
            }else{
                indexOfOneAndOnlyFaceUpCard = index
                self.score = 0
            }
        }
    }
}

extension Collection {
    var ondeAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
