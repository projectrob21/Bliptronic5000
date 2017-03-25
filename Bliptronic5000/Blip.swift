//
//  Blip.swift
//  Bliptronic5000
//
//  Created by Robert Deans on 3/25/17.
//  Copyright © 2017 Robert Deans. All rights reserved.
//

import Foundation

struct Blip {
    
    var isActive: Bool
    var column: Int
    var row: Int
    
    init(column: Int, row: Int) {
        isActive = false
        self.row = row
        self.column = column
        
    }
}
