//
//  RandomGenerator.swift
//  RandomGeneratorFramework
//
//  Created by Justin Kim on 3/2/18.
//  Copyright © 2018 Justin Kim. All rights reserved.
//

import Foundation

public class RandomGenerator {
    
    private init() {}
    
    public static func string() -> String {
        return UUID().uuidString
    }
    
    public static func integer() -> Int {
        return Int(arc4random())
    }
}

