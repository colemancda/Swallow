//
//  AlmostEquatable.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/23/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

public protocol AlmostEquatable: Equatable {
    
    typealias Tolerance
    
    /// Performs equality with a specified tolerance
    func almostEqual(rhs: Self, tolerance: Tolerance) -> Bool
}