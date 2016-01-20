//
//  Color.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

public struct Color: Equatable {
    
    // MARK: - Properties
    
    public var value: CUnsignedInt
    
    // MARK: - Initialization
    
    public init(_ value: CUnsignedInt) {
        
        self.value = value
    }
    
    public init(r: UInt8, g: UInt8, b: UInt8) {
        
        self.value = CUnsignedInt( ( CInt(r) << 16) | ( CInt(g) << 8) | CInt(b) )
    }
    
    public init(a: UInt8, r: UInt8, g: UInt8, b: UInt8) {
        
        self.value = CUnsignedInt( ( CInt(a) << 24) | ( CInt(r) << 16) | ( CInt(g) << 8) | CInt(b) )
    }
}

// MARK: - Equatable

public func == (lhs: Color, rhs: Color) -> Bool {
    
    return (lhs.value & 0xffffff) == (rhs.value & 0xffffff)
}

public extension Color {
    
    func equalARGB(rhs: Color) -> Bool {
        
        return self == rhs
    }
}