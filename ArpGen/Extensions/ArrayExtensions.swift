//
//  ArrayExtensions.swift
//  ArpGen
//
//  Created by Brian on 27/12/2018.
//  Copyright © 2018 Eviathan. All rights reserved.
//

import Foundation

//extension Array {
//    mutating func rotateLeft(by rotations:Int)
//    {
//        // rotation irrelevant when less than 2 elements
//        if count < 2 { return }
//        
//        // effective left rotation for negative and > count
//        let rotations = (rotations%count + count) % count
//        
//        // no use rotating by zero
//        if rotations == 0 { return }
//        
//        // rotate
//        (1..<count).reduce(0)
//        { let i = ($0.0+rotations)%count; swap(&self[$0.0],&self[i]); return i }
//    }
//    
//    mutating func reverse()
//    {
//        (0..<count/2).forEach{ swap(&self[$0],&self[count-$0-1]) }
//    }
//}
