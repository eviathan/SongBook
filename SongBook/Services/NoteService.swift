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
    
    class func getNextInterval(_ current: Interval, _ next: Interval) -> Interval {
        return Interval(rawValue: (current.rawValue + next.rawValue) % 12)!
    }
    
    class func getInterval(_ from: Interval, _ to: Interval) -> Interval {
        var interval = 0
        
        for i in 0...11 {
            let index = (i + from.rawValue) % 12

            if Interval(rawValue: index) == to {
                break
            }
            
            interval+=1
        }
        
        return Interval(rawValue: interval) ?? .I
    }
    
    class func getIntervals(_ notes: Note..., key: Note) -> [Interval] {
        return notes.map({ $0.interval(key: key) })
    }
}

