//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {
    
    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var firstPlayer = Player()
        var min: Value = .ace
        for player in players {
            let trumpCards = player.hand?.filter{$0.isTrump == true}
            if let trumpCards = trumpCards {
                for card in trumpCards {
                    if card.value.rawValue <= min.rawValue {
                        min = card.value
                        firstPlayer = player
                    }
                }
            }
        }
        return firstPlayer
    }
    
}

