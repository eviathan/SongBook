//
//  main.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation


//let majorScale: ScaleType = .Major
//var notes = majorScale.getNotes(.F)
//print(notes)

//print(Note.Eb.interval(key: .C))


print(ChordService.getChordType(.I, .III, .V, .bVII))
print(ChordService.getChordType(.I, .III, .V, .VII))

print(Chord(.C, .Min7b5).notes.invert(.Third))
