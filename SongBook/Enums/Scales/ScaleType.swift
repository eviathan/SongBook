//
//  ScaleType.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

public enum ScaleType: CustomStringConvertible {
    
    // Major
    case Major(_ mode: MajorMode?)
    
    // Minor
    case Minor
    case HarmonicMinor(_ mode: HarmonicMinorMode?)
    case MelodicMinor(_ mode: MelodicMinorMode?)
    
    // Pentatonics
    case MajorPentatonic
    case MinorPentatonic
    
    // Blues
    case Blues(_ style: ScaleStyle)
    
    // Wholetone & Diminished
    case Wholetone
    case Diminished
    
    public var description: String {
        let mirror = Mirror(reflecting: self)
        return mirror.children.first?.label ?? String(describing: self)
    }
    
    var degrees: [Degree] {
        return Array(Degree.allCases.prefix(self.intervals.count))
    }
    
    var intervals: [Interval] {
        switch self {
        // Major Modes
        case .Major(let mode): do {
            if let m = mode {
                switch m {
                case .Ionian: return [.I, .II, .III, .IV, .V, .VI, .VII]
                case .Dorian: return [.I, .II, .bIII, .IV, .V, .VI, .bVII]
                case .Phrygian: return [.I, .bII, .bIII, .IV, .V, .bVI, .bVII]
                case .Lydian: return [.I, .II, .III, .bV, .V, .VI, .VII]
                case .Mixolydian: return [.I, .II, .III, .IV, .V, .VI, .bVII]
                case .Aeolian: return [.I, .II, .bIII, .IV, .V, .bVI, .bVII]
                case .Locrian: return [.I, .bII, .bIII, .IV, .bV, .bVI, .bVII]
                }
            } else {
                return ScaleType.Major(.Ionian).intervals
            }
        }
        
        // (Natural) Minor
        case .Minor: return ScaleType.Major(.Aeolian).intervals
            
        // Harmonic Minor (w/Modes)
        case .HarmonicMinor(let mode): do {
            if let m = mode {
                switch m {
                case .HarmonicMinor: return [.I, .II, .bIII, .IV, .V, .bVI, .VII]
                case .Locrian13: return [.I, .bII, .bIII, .IV, .bV, .VI, .bVII]
                case .IonianSharp5: return [.I, .II, .III, .IV, .bVI, .VI, .VII]
                case .DorianSharp11: return [.I, .II, .bIII, .bV, .V, .VI, .bVII]
                case .PhrygianDominant: return [.I, .bII, .III, .IV, .V, .bVI, .bVII]
                case .LydianSharp2: return [.I, .bIII, .III, .bV, .V, .VI, .VII]
                case .SuperLocrianbb7: return [.I, .bII, .bIII, .III, .bV, .bVI, .bVII]
                }
            } else {
                return ScaleType.HarmonicMinor(.HarmonicMinor).intervals
            }
        }
            
        // Meoldic Minor (w/Modes)
        case .MelodicMinor(let mode): do {
            if let m = mode {
                switch m {
                case .MelodicMinor: return [.I, .II, .bIII, .IV, .V, .VI, .VII]
                case .Dorianb2: return [.I, .bII, .bIII, .IV, .V, .VI, .bVII]
                case .LydianAugmented: return [.I, .bII, .bIII, .bV, .bVI, .VI, .bVII]
                case .LydianDominant: return [.I, .II, .III, .bV, .V, .VI, .bVII]
                case .Mixolydianb6: return [.I, .II, .III, .IV, .V, .bVI, .bVII]
                case .Aeolianb5: return [.I, .II, .bIII, .IV, .bV, .bVI, .bVII]
                case .AlteredScale: return [.I, .bII, .bIII, .III, .bV, .bVI, .bVII]
                }
            } else {
                return ScaleType.HarmonicMinor(.HarmonicMinor).intervals
            }
        }
            
        // Pentatonics
        case .MajorPentatonic: return [.I, .II, .III, .V, .VI]
        case .MinorPentatonic: return [.I, .bIII, .IV, .V, .bVII]
            
        // Blues
        case .Blues(let style): do {
            switch style {
            case .Hexatonic: return [.I, .bIII, .IV, .bV, .V, .bVII]
            case .Heptatonic: return [.I, .II, .bIII, .IV, .bV, .VI, .bVII]
            case .Nonatonic: return [.I, .II, .bIII, .bIII, .IV, .bV, .V, .VI, .bVII]
                
            default: return ScaleType.Blues(.Heptatonic).intervals
            }
        }
            
        // Wholetone & Diminished
        case .Wholetone: return [.I, .II, .III, .bV, .bVI, .bVII]
        case .Diminished: return [.I, .bII, .bIII, .III, .bV, .V, .VI, .VII]
            
        }
    }
    
    func getNotes(_ key: Note) -> [Note] {
        return NoteService.getNotes(self.intervals, key: key)
    }
    
    func getInterval(_ current: Degree, next: Degree) -> Interval {
        
        let currentIndex = current.rawValue % self.intervals.count
        let nextIndex = (next.rawValue + currentIndex) % self.intervals.count
        
        return self.intervals[nextIndex % self.intervals.count]
    }
}
