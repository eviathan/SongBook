//
//  NoteUtility.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public class NoteService {
    class func getNotes(_ intervals: Interval..., key: Note) -> [Note] {
        return getNotes(intervals, key: key)
    }
    
    class func getNotes(_ intervals: [Interval], key: Note) -> [Note] {
        var output = [Note]()
        let indexOfRoot = key.rawValue
        
        for i in 0...intervals.count - 1 {
            let index = (indexOfRoot + intervals[i].rawValue) % Note.allCases.count
            let currentNote = Note(rawValue: index)!
            
            output.append(currentNote)
        }
        
        return output
    }
    
    class func getIntervals(_ notes: Note..., key: Note) -> [Interval] {
        return notes.map({ $0.interval(key: key) })
    }
}

