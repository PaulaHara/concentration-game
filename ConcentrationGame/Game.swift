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
    private(set) var flipCount = 0
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.ondeAndOnly
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
        
        flipCount += 1
        cards[index].numFlip += 1
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[index] == cards[matchIndex] {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                    calculateScore(flipCard1: 0, flipCard2: 0)
                }else{
                    calculateScore(flipCard1: cards[index].numFlip, flipCard2: cards[matchIndex].numFlip)
                }
                cards[index].isFaceUp = true
            }else{
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    private mutating func calculateScore(flipCard1: Int, flipCard2: Int){
        var points = 0
        
        if(flipCard1 > 1){
            points = -1
        }
        if(flipCard2 > 1) {
            points += -1
        }
        if(flipCard1 == 0 && flipCard2 == 0) {
            points = 2
        }
        
        self.score = self.score == 0 && points < 0 ? 0 : self.score+points
    }
}

extension Collection {
    var ondeAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
