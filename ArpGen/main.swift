//
//  main.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation


let majorScale: Scale = .Major(.Db)
var notes = majorScale.getNotes()
print(notes)

//let chords = majorScale.getChords(type: .Seventh)
//print(chords)

