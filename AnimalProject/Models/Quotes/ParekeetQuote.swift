//
//  ParekeetQuote.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 17/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import Foundation

class ParekeetQuote: QuoteProtocol {
    var quotes: [Quote]
    
    init(quotes: [Quote]) {
        self.quotes = quotes
    }
    
    func quoteRequester() -> [Quote] {
        return quotes
    }
}
