//
//  Chords.swift
//  SongBook
//
//  Created by Brian on 28/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public class ChordItem: Equatable {
    
    var type: Chord = .Maj
    var notes: [ScaleDegree] = [ScaleDegree]()
    
    init(type: Chord){
        self.type = type
    }
    
    public static func == (lhs: ChordItem, rhs: ChordItem) -> Bool {
        return lhs.notes.elementsEqual(rhs.notes)
    }
}
extension ChordItem {
    
    func getIntervals() -> [ScaleDegree] {
        switch self.type {
        case .Maj: return [.I, .III, .V]
        case .Min: return [.I, .bIII, .V]
        case .Dom7: return [.I, .III, .V, .bVII]
        case .Maj7: return [.I, .III, .V, .VII]
        case .Min7: return [.I, .bIII, .V, .bVII]
        case .Aug: return [.I, .III, .bVI]
        case .Dim: return [.I, .bIII, .bVI]
        default:
            return [ScaleDegree]()
        }
    }
    
    func getNotes(key: Note) -> [Note] {
        switch self.type {
        case .Maj: fallthrough
        case .Min: fallthrough
        case .Dom7: fallthrough
        case .Maj7: fallthrough
        case .Min7: fallthrough
        case .Aug: fallthrough
        case .Dim:
            return NoteService.getNotesFromFormula(key, self.getIntervals())
        default:
            return [Note]()
        }
    }
}
