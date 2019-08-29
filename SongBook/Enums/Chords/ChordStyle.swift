//
//  ChordTypes.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

// NOTE: rawValue = the amount of thirds
public enum ChordStyle: Int {
    case Triad = 2
    case Seventh = 3
    case Ninth = 4
    case Eleventh = 5
    case Thirteenth = 6
}
