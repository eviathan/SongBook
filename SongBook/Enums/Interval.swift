//
//  ScaleDegreeType.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public enum Interval: Int, CustomStringConvertible {
 
    // FIRST OCTAVE
    case I = 0
    case bII = 1
    case II = 2
    case bIII = 3
    case III = 4
    case IV = 5
    case bV = 6
    case V = 7
    case bVI = 8
    case VI = 9
    case bVII = 10
    case VII = 11
    
    public var noteIndex: Int {
        switch self {
        case .I: return 0
        case .bII: return 1
        case .II: return 2
        case .bIII: return 3
        case .III: return 4
        case .IV: return 5
        case .bV: return 6
        case .V: return 7
        case .bVI: return 8
        case .VI: return 9
        case .bVII: return 10
        case .VII: return 11
        }
    }
    
    // TODO: SORT THIS MESS OUT
    public var description: String {
        switch self {
        case .I: return "R"
        case .bII: return "b2"
        case .II: return "2"
        case .bIII: return "b3"
        case .III: return "3"
        case .IV: return "4"
        case .bV: return "b5"
        case .V: return "5"
        case .bVI: return "b6"
        case .VI: return "6"
        case .bVII: return "b7"
        case .VII: return "7"
        }
    }
}
