//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?
    
    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        if let hand = hand {
            for cards in hand {
                if cards.value == card.value {
                    return true
                }
            }
        }
        return false
    }
    
    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        if let hand = hand {
            for cards in hand {
                for tableCards in table {
                    if cards.value == tableCards.value.value {
                        return true
                    }
                    if cards.value == tableCards.key.value {
                        return true
                    }
                }
            }
        }
        
        return false
    }
}
