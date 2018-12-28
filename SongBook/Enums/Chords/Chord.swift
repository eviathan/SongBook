//
//  ChordType.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public enum Chord: CustomStringConvertible {
    
    case Maj
    case Min
    case Dom7
    case Maj7
    case Min7
    case Aug
    case Dim
    case Dim7
    case Min7b5
    case Sus4
    case Sus2
    case Sixth
    case Min6
    case Ninth
    case Add9
    case Maj9
    case Min9
    
    public var description: String {
        let mirror = Mirror(reflecting: self)
        return mirror.children.first?.label ?? String(describing: self)
    }
}

extension Chord {
    func getIntervals() -> [ScaleDegree] {
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
            return [ScaleDegree]()
        }
    }
    
    func getNotes(_ key: Note, inversion: Inversion = .Root) -> [Note] {
        return NoteService
                    .getNotesFromFormula(key, self.getIntervals())
                    .invert(inversion)
        
    }
}
