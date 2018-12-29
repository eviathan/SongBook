//
//  Chords.swift
//  SongBook
//
//  Created by Brian on 28/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public class Chord: Equatable {
    
    var type: ChordType = .Maj
    
    init(type: ChordType){
        self.type = type
    }
    
    public static func == (lhs: Chord, rhs: Chord) -> Bool {
        return lhs.getIntervals().elementsEqual(rhs.getIntervals())
    }
}
extension Chord {
    
    func getIntervals() -> [Interval] {
        switch self.type {
        case .Maj: return [.I, .III, .V]
        case .Min: return [.I, .bIII, .V]
        case .Dom7: return [.I, .III, .V, .bVII]
        case .Maj7: return [.I, .III, .V, .VII]
        case .Min7: return [.I, .bIII, .V, .bVII]
        case .Aug: return [.I, .III, .bVI]
        case .Dim: return [.I, .bIII, .bVI]
        default:
            return [Interval]()
        }
    }
    
    func getNotes(key: Note) -> [Note] {
        return NoteService.getNotesFromIntervals(self.getIntervals(), key: key)
    }
}
