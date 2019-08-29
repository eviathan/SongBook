//
//  Degree.swift
//  SongBook
//
//  Created by Brian on 30/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public enum Degree: Int, CaseIterable, CustomStringConvertible {
    case I = 0
    case II = 1
    case III = 2
    case IV = 3
    case V = 4
    case VI = 5
    case VII = 6
    case VIII = 7
    case IX = 8
    case X = 9
    case XI = 10
    case XII = 11
    
    public var description: String {
        switch self {
        case .I: return "I"
        case .II: return "II"
        case .III: return "III"
        case .IV: return "IV"
        case .V: return "V"
        case .VI: return "VI"
        case .VII: return "VII"
        case .VIII: return "VIII"
        case .IX: return "IX"
        case .X: return "X"
        case .XI: return "XI"
        case .XII: return "XII"
        }
    }
}
