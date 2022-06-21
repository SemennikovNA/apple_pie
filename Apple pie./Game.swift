//
//  Game.swift
//  Apple pie.
//
//  Created by rezra on 21.06.2022.
//

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    fileprivate var guessedLetters = [Character]()
    
    init(word: String, incorrectMovesRemaining: Int) {
        self.word = word
        self.incorrectMovesRemaining = incorrectMovesRemaining
    }
    
    mutating func playerGuessed(letter: Character) {
        let lowercasedLetter = Character(letter.lowercased())
        guessedLetters.append(letter)
        if !word.lowercased().contains(lowercasedLetter) {
            incorrectMovesRemaining -= 1
        }
    }
}
