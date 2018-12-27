//
//  NoteUtility.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public class NoteService {
    private static let chromaticScale: [Note] = [.A, .Bb, .B, .C, .Db, .D, .Eb, .E, .F, .Gb, .G, .Ab]
    
    class func getNotesFromFormula(_ key: Note, _ degrees: ScaleDegree...) -> [Note] {
        var output = [Note]()
        let indexOfRoot = chromaticScale.firstIndex(of: key) ?? 0
        
        for i in 0...degrees.count - 1 {
            let index = (indexOfRoot + degrees[i].rawValue) % chromaticScale.count
            let currentNote = chromaticScale[index]
            output.append(currentNote)
        }
        
        return output
    }
}

