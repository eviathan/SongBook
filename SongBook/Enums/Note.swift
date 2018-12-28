//
//  Note.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public enum Note: String, CustomStringConvertible {
    case C
    case Db
    case D
    case Eb
    case E
    case F
    case Gb
    case G
    case Ab
    case A
    case Bb
    case B
    
    public var description: String {
        return self.rawValue
    }
}

extension Note {
    func getMIDINumber(octave: Int = 0) -> Int {
        switch self {
        case .A:
            return 21 + (octave * 12)
        case .Bb:
            return 22 + (octave * 12)
        case .B:
            return 23 + (octave * 12)
        case .C:
            return 24 + (octave * 12)
        case .Db:
            return 25 + (octave * 12)
        case .D:
            return 26 + (octave * 12)
        case .Eb:
            return 27 + (octave * 12)
        case .E:
            return 28 + (octave * 12)
        case .F:
            return 29 + (octave * 12)
        case .Gb:
            return 30 + (octave * 12)
        case .G:
            return 31 + (octave * 12)
        case .Ab:
            return 32 + (octave * 12)
        }
    }
}
