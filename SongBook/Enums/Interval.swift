//
//  ScaleDegreeType.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public enum Interval: Int, CustomStringConvertible {
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
    
    public var description: String {
        switch self {
        case .I: return "I"
        case .bII: return "bII"
        case .II: return "II"
        case .bIII: return "bIII"
        case .III: return "III"
        case .IV: return "IV"
        case .bV: return "bV"
        case .V: return "V"
        case .bVI: return "bVI"
        case .VI: return "VI"
        case .bVII: return "bVII"
        case .VII: return "VII"
        }
    }
}
