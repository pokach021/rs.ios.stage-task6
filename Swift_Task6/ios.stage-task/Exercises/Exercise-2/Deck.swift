import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {
    
    //MARK: - Properties
    
    var cards = [Card]()
    var type: DeckType
    var trump: Suit?
    
    var total:Int {
        return type.rawValue
    }
}

extension Deck {
    
    init(with type: DeckType) {
        self.type = type
        let values = Value.allCases
        let suits = Suit.allCases
        cards = createDeck(suits: suits, values: values)
    }
    
    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var deck = [Card]()
        for suit in suits {
            for value in values {
                deck.append(Card(suit: suit, value: value))
            }
        }
        return deck
    }
    
    public mutating func shuffle() {
        cards.shuffle()
    }
    
    public mutating func defineTrump() {
        trump = cards.first?.suit
        if let trump = trump {
            setTrumpCards(for: trump)
        }
    }
    
    public mutating func initialCardsDealForPlayers(players: [Player]) {
        if players.count < 7 {
            for player in players {
                if player.hand == nil {
                    player.hand = [Card]()
                }
                player.hand?.append(contentsOf: cards[0...5])
                cards.removeFirst(6)
            }
        }
    }
    
    public mutating func setTrumpCards(for suit:Suit) {
        for (index, value) in cards.enumerated() {
            if value.suit == suit {
                cards[index].isTrump = true
            }
        }
        
    }
}

