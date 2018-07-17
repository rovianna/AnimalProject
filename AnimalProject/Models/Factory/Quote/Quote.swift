//
//  Quote.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 17/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import Foundation

protocol QuoteProtocol {
    func quoteRequester() -> [Quote]
}

struct Quote {
    var animal: Animal
    var quote: [String]
}
