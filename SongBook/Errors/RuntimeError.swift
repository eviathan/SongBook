//
//  RuntimeError.swift
//  SongBook
//
//  Created by Brian on 31/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

struct RuntimeError: Error {
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
    
    public var localizedDescription: String {
        return message
    }
}
