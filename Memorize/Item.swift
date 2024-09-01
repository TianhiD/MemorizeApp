//
//  Item.swift
//  Memorize
//
//  Created by Tianhi Devold on 01/09/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
