//
//  QuoteFactory.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 17/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import Foundation

struct QuoteFactory {
    static func getQuote(for specie: Animal.Specie) -> QuoteProtocol {
        var quote = [Quote]()
        switch specie {
        case .Dog: return DogQuote(quotes: quote)
        case .Cat: return CatQuote(quotes: quote)
        case .Ferret: return FerretQuote(quotes: quote)
        case .Parekeet: return ParekeetQuote(quotes: quote)
        case .Parrot: return ParrotQuote(quotes: quote)
        }
    }
}
