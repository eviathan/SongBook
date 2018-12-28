//
//  ScaleType.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public enum Scale: CustomStringConvertible {
    case Major(_ key: Note)
    case NaturalMinor(_ key: Note)
    case HarmonicMinor(_ key: Note)
    case MelodicMinor(_ key: Note)
    
    // Pentatonics
    // Blues
    // Eastern
    // Wholetone
    
    public var description: String {
        return Mirror(reflecting: self).children.first?.label ?? String(describing: self)
    }
}

extension Scale {
    func getIntervals() -> [ScaleDegree] {
        switch self {
        case .Major(_): return [.I, .II, .III, .IV, .V, .VI, .VII]
        case .NaturalMinor(_): return [.I, .II, .bIII, .IV, .V, .bVI, .bVII]
        default:
            return [ScaleDegree]()
        }
    }
    
    func getNotes() -> [Note] {
        switch self {
        case .Major(let key): fallthrough
        case .NaturalMinor(let key):
            return NoteService.getNotesFromFormula(key, self.getIntervals())
        default:
            return [Note]()
        }
    }
    
    func getChords(type: ChordType = .Triad, inversion: Inversion = .Root) -> [Chord] {
        switch self {
        case .Major(_): fallthrough
        case .NaturalMinor(_): fallthrough
        case .HarmonicMinor(_): fallthrough
        case .MelodicMinor(_):
            return [Chord]() //NoteService.getChords(key: key, scale: self, type: type)
        }
    }
}

