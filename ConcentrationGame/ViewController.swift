//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by paula on 2018-09-24.
//  Copyright © 2018 paula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private weak var gameScoreLabel: UILabel!
    @IBOutlet private var buttonCards: [UIButton]!
    @IBOutlet private var newGameButton: UIButton!
    
    private lazy var game = Game(numberOfPairOfCards: numberOfPairOfCards)
    
    var numberOfPairOfCards: Int {
        return buttonCards.count / 2
    }
    
    private var emojiLibrary = [Card: String]()
    private lazy var emojis = GameThemes.getRandomTheme()
    
    private(set) var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }
    
    private(set) var gameScore = 0 {
        didSet{
            gameScoreLabel.text = "Score: \(gameScore)"
        }
    }

    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = buttonCards.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            calculateScore(points: game.score)
        }
        
    }
    
    private func calculateScore(points: Int){
        gameScore += game.score
        if gameScore <= 0 {
            gameScore = 0;
        }
    }
    
    private func updateViewFromModel() {
        for index in buttonCards.indices{
            let button = buttonCards[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitle(getEmoji(for: card), for: .normal)
            }else{
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
                button.setTitle("", for: .normal)
            }
        }
    }
    
    private func getEmoji(for card: Card) -> String {
        if emojiLibrary[card] == nil, emojis.count > 0 {
            let randomIndex = Int.random(in: 0..<emojis.count)
            emojiLibrary[card] = emojis.remove(at: randomIndex)
        }
        
        return emojiLibrary[card] ?? "?"
    }
    
    @IBAction private func touchNewGameBtn(){
        flipCount = 0
        gameScore = 0
        
        emojiLibrary = [Card: String]()
        emojis = GameThemes.getRandomTheme()
        
        game = Game(numberOfPairOfCards: numberOfPairOfCards)
        
        for index in buttonCards.indices{
            buttonCards[index].backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            buttonCards[index].setTitle("", for: .normal)
        }
    }

}

