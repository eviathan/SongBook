//
//  ScaleType.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public enum Scale: CustomStringConvertible {
    case Major(key: Note)
    case NaturalMinor(key: Note) // NOTE: Same as Aeolian Mode
    case HarmonicMinor(key: Note)
    case MelodicMinor(key: Note)
    
    public var description: String {
        return Mirror(reflecting: self).children.first?.label ?? String(describing: self)
    }
}

extension Scale {
    func getNotes() -> [Note] {
        switch self {
        case .Major(let key):
            return NoteService.getNotesFromFormula(key, .I, .II, .III, .IV, .V, .VI, .VII)
        case .NaturalMinor(let key):
            return NoteService.getNotesFromFormula(key, .I, .II, .bIII, .IV, .V, .bVI, .bVII)
        default:
            return [Note]()
        }
    }
    
    func getChords() -> [Chord] {
        switch self {
        case .Major(_):
            let notes = self.getNotes()
            return [.Maj(notes[0]), .Min(notes[1]), .Min(notes[2]), .Maj(notes[3]), .Maj(notes[4]), .Min(notes[5]), .Dim(notes[6])]

        default:
            return [Chord]()
        }
    }
}

