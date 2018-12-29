//
//  ChordType.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public enum ChordType: String, CaseIterable, CustomStringConvertible {
    
    case Maj = "Major"
    case Min = "Minor"
    case Dom7 = "Dominant 7th"
    case Maj7 = "Major 7th"
    case Min7 = "Minor 7th"
    case Aug = "Augmented"
    case Dim = "Diminished"
    case Dim7 = "Diminished 7th"
    case Min7b5 = "Minor 7th Flat 5th"
    case Sus4 = "Suspended 4th"
    case Sus2 = "Suspended 2nd"
    case Sixth = "6th"
    case Min6 = "Minor 6th"
    case Ninth = "9th"
    case Add9 = "Add 9"
    case Maj9 = "Major 9th"
    case Min9 = "Minor 9th"
    
    public var description: String {
        return self.rawValue
    }
}

extension ChordType {
    func getIntervals() -> [Interval] {
        switch self {
        case .Maj: return [.I, .III, .V]
        case .Min: return [.I, .bIII, .V]
        case .Dom7: return [.I, .III, .V, .bVII]
        case .Maj7: return [.I, .III, .V, .VII]
        case .Min7: return [.I, .bIII, .V, .bVII]
        case .Aug: return [.I, .III, .bVI]
        case .Dim: return [.I, .bIII, .bVI]
            
        // TODO: Finish adding chord formulas
        default:
            return [Interval]()
        }
    }
    
    func getNotes(_ key: Note, inversion: Inversion = .Root) -> [Note] {
        return NoteService
            .getNotes(self.getIntervals(), key: key)
                    .invert(inversion)
    }
}
