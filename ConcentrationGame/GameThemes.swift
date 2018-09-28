//
//  Themes.swift
//  ConcentrationGame
//
//  Created by paula on 2018-09-27.
//  Copyright © 2018 paula. All rights reserved.
//

import Foundation

struct GameThemes {
    private static var gameThemes = [["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"],
                              ["🌞", "🌝", "🌛", "🌜", "🌚", "🌕", "🌖", "🌗", "🌘", "🌑", "🌒", "🌓", "🌔", "🌙"],
                              ["🌈", "☀️", "⛅️", "🌧", "⛈", "🌩", "❄️", "☃️", "🌬", "💨", "💦", "☔️", "🌊", "🌤"],
                              ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑", "🍍", "🥥"],
                              ["🥞", "🥓", "🥩", "🍗", "🍖", "🌭", "🍔", "🍟", "🍕", "🥪", "🥙", "🌮", "🌯", "🍱"],
                              ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱", "🏓", "🏸", "🏒", "⛳️", "🏹", "⛸"],
                              ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🏍"],
                              ["🇧🇷", "🇮🇴", "🇻🇬", "🇧🇳", "🇨🇦", "🇧🇫", "🇧🇬", "🇯🇵", "🇮🇹", "🇬🇳", "🇬🇧", "🇺🇸", "🇰🇷", "🇲🇸"]]
    
    static func getRandomTheme() -> [String] {
        let index = Int.random(in: 0..<gameThemes.count)
        return gameThemes[index]
    }
}

