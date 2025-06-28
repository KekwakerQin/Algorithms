enum Rank: Int, CaseIterable {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace: return "ace"
        case .jack: return "jack"
        case .queen: return "queen"
        case .king: return "king"
        default: return String(self.rawValue)
        }
    }
}

enum Suit: String, CaseIterable {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        return self.rawValue
    }
}

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDesciption() -> String {
        return "the rank: \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

func fullDeck() -> [Card] {
    var deck: [Card] = []
    
    for suit in Suit.allCases {
        for rank in Rank.allCases {
            deck.append(Card(rank: rank, suit: suit))
        }
    }
    
    return deck
}
//
//let a = fullDeck()
//print(a.count)
//for i in a {
//    print(i.simpleDesciption())
//}
