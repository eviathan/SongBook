//
//  ChordService.swift
//  SongBook
//
//  Created by Brian on 29/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

// TODO: IMPLEMENT THESE
public class ChordService {
    
    // Chord Type
    class func getChordType(_ intervals: [Interval]) -> ChordType {
        return Appendix.instance.chordTypes[intervals] ?? .NA
    }
    
    class func getChordType(_ intervals: Interval...) -> ChordType {
        return getChordType(intervals)
    }
    
    class func getChordTypes(_ scaleType: ScaleType, style: ChordStyle) -> [ChordType] {
        
        var chordTypes = [ChordType]()
        let scaleSize = scaleType.intervals.count
        
        for i in 0...scaleType.intervals.count-1 {
            var tmpIntervals = [Interval]()
            
            let root = scaleType.intervals[i%scaleSize]
            tmpIntervals.append(.I)
            
            let third = scaleType.getInterval(Degree(rawValue: (i)%scaleSize)!, next: .III)
            tmpIntervals.append(NoteService.getInterval(root, third))
            
            let fifth = scaleType.getInterval(Degree(rawValue: (i+2)%scaleSize)!, next: .III)
            tmpIntervals.append(NoteService.getInterval(root, fifth))
            
            
            
            if([.Seventh, .Ninth, .Eleventh, .Thirteenth].contains(style)) {
                let seventh = scaleType.getInterval(Degree(rawValue: (i+4)%scaleSize)!, next: .III)
                tmpIntervals.append(NoteService.getInterval(root, seventh))
            }
            
            if([.Ninth, .Eleventh, .Thirteenth].contains(style)) {
                let ninth = scaleType.getInterval(Degree(rawValue: (i+6)%scaleSize)!, next: .III)
                tmpIntervals.append(NoteService.getInterval(root, ninth))
            }
            
            if([.Eleventh, .Thirteenth].contains(style)) {
                let eleventh = scaleType.getInterval(Degree(rawValue: (i+8)%scaleSize)!, next: .III)
                tmpIntervals.append(NoteService.getInterval(root, eleventh))
            }
            
            let sortedIntervals = tmpIntervals.sorted(by: { $0.rawValue < $1.rawValue })
            
            print(sortedIntervals)
            
            chordTypes.append(ChordService.getChordType(sortedIntervals))
        }
        
        return chordTypes
    }
    
    // Chord
    class func getChords(_ notes: [Note]) -> [Chord] {
        return [Chord]()
    }
    
    class func getChords(_ notes: Note...) -> [Chord] {
        return getChords(notes)
    }
}
