//
//  ArrayExtensions.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

extension Collection {

    
        mutating func reverse()
        {
//            (0..<count/2).forEach{ swap(&self[$0],&self[count-$0-1]) }
        }
}

extension Collection where Element == Note {
    func rotate(by rotations:Int) -> [Note]
    {
        var notes = self as! [Note]
        if rotations <= 0 {
            return notes
        }
        
        var output = [Note]()
        
        var offset = rotations
        if (rotations > notes.count) {
            offset = offset % notes.count
        }
        
        for i in offset...notes.count-1 {
            output.append(notes[i])
        }
        
        for i in 0...offset-1 {
            output.append(notes[i])
        }
        
        return output
    }
    
    func invert(_ inversion: Inversion) -> [Note] {
        return self.rotate(by: inversion.rawValue)
    }
}
