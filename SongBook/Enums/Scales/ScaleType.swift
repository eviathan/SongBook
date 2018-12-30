//
//  ScaleType.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public enum ScaleType: CustomStringConvertible {
    case Major
    case Minor
    case HarmonicMinor
    case MelodicMinor
    
    // Pentatonics
    // Blues
    // Eastern
    // Wholetone
    
    public var description: String {
        let mirror = Mirror(reflecting: self)
        return mirror.children.first?.label ?? String(describing: self)
    }
    
    var intervals: [Interval] {
        switch self {
        case .Major: return [.I, .II, .III, .IV, .V, .VI, .VII]
        case .Minor: return [.I, .II, .bIII, .IV, .V, .bVI, .bVII]
            
        // TODO: Finish adding chord formulas
        default:
            return [Interval]()
        }
    }
    
    func getNotes(_ key: Note) -> [Note] {
        return NoteService
            .getNotes(self.intervals, key: key)
    }
}
