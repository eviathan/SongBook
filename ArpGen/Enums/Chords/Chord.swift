//
//  ChordType.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public enum Chord: CustomStringConvertible {
    case Maj(_ key: Note)
    case Min(_ key: Note)
    case Dom7(_ key: Note)
    case Maj7(_ key: Note)
    case Min7(_ key: Note)
    case Aug(_ key: Note)
    case Dim(_ key: Note)
    case Dim7(_ key: Note)
    case Min7b5(_ key: Note)
    case Sus4(_ key: Note)
    case Sus2(_ key: Note)
    case Sixth(_ key: Note)
    case Min6(_ key: Note)
    case Ninth(_ key: Note)
    case Add9(_ key: Note)
    case Maj9(_ key: Note)
    case Min9(_ key: Note)
    
    public var description: String {
        let mirror = Mirror(reflecting: self)
        return mirror.children.first?.label ?? String(describing: self)
    }
}

extension Chord {
    func getNotes() -> [Note] {
        switch self {
        case .Maj(let key):
            return NoteService.getNotesFromFormula(key, .I, .III, .V)
        case .Min(let key):
            return NoteService.getNotesFromFormula(key, .I, .bIII, .V)
        case .Dom7(let key):
            return NoteService.getNotesFromFormula(key, .I, .III, .V, .bVII)
        case .Maj7(let key):
            return NoteService.getNotesFromFormula(key, .I, .III, .V, .VII)
        case .Min7(let key):
            return NoteService.getNotesFromFormula(key, .I, .bIII, .V, .bVII)
        case .Aug(let key):
            return NoteService.getNotesFromFormula(key, .I, .III, .bVI)
        case .Dim(let key):
            return NoteService.getNotesFromFormula(key, .I, .bIII, .bVI)
        default:
            return [Note]()
        }
    }
    
    // TODO: Implement this
//    func getChordFrom(notes: [Note]) -> Chord {
//        
//        
//        
//        return .Maj(.C)
//    }
}
