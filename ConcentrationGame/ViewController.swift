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
    
    var numberOfPairOfCards: Int {
        return buttonCards.count / 2
    }
    
    private lazy var game = Game(numberOfPairOfCards: numberOfPairOfCards)
    private var emojiLibrary = [Card: String]()
    private var emojis = GameThemes.getRandomTheme()

    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = buttonCards.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        gameScoreLabel.text = "Score: \(game.score)"
        flipCountLabel.text = "Flip: \(game.flipCount)"
        
        for index in buttonCards.indices{
            if game.cards[index].isFaceUp {
                setCardTitleAndBackground(button: buttonCards[index], title: getEmoji(for: game.cards[index]), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            }else{
                setCardTitleAndBackground(button: buttonCards[index], title: "", color: game.cards[index].isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
            }
        }
    }
    
    private func getEmoji(for card: Card) -> String {
        if emojiLibrary[card] == nil, emojis.count > 0 {
            emojiLibrary[card] = emojis.remove(at: Int.random(in: 0..<emojis.count))
        }
        return emojiLibrary[card] ?? "?"
    }
    
    @IBAction private func touchNewGameBtn(){
        emojiLibrary = [Card: String]()
        emojis = GameThemes.getRandomTheme()
        game = Game(numberOfPairOfCards: numberOfPairOfCards)
        updateViewFromModel()
    }
    
    private func setCardTitleAndBackground(button: UIButton, title: String, color: UIColor) {
        button.backgroundColor = color
        button.setTitle(title, for: .normal)
    }
}
