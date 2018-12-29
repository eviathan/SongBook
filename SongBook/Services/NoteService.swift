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
        let indexOfRoot = Constants.chromaticScale.firstIndex(of: key) ?? 0
        
        for i in 0...intervals.count - 1 {
            let index = (indexOfRoot + intervals[i].rawValue) % Constants.chromaticScale.count
            let currentNote = Constants.chromaticScale[index]
            
            output.append(currentNote)
        }
        
        return output
    }
    
    class func getInterval(_ note: Note, key: Note) -> Interval {
        return .I
    }
    
    class func getIntervals(_ notes: Note..., key: Note) -> [Interval] {
        return notes.map({ getInterval($0, key: key) })
    }
}

