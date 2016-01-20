//
//  Color.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Unsigned integer representation of a color.
public struct Color: Equatable {
    
    // MARK: - Properties
    
    public var value: CUnsignedInt
    
    // MARK: - Initialization
    
    public init(_ value: CUnsignedInt) {
        
        self.value = value
    }
    
    public init(alpha: UInt8? = nil, red: UInt8, green: UInt8, blue: UInt8) {
        
        let rgbValue: CInt = (CInt(red) << 16) | (CInt(green) << 8) | CInt(blue)
        
        if let alpha = alpha {
            
            let argbValue = (CInt(alpha) << 24) | rgbValue
            
            self.value = CUnsignedInt(bitPattern: argbValue)
        }
        else {
            
            self.value = CUnsignedInt(rgbValue)
        }
    }
    
    // MARK: - Getters
    
    public var alpha: UInt8 {
        
        return UInt8((self.value >> 24) & CUnsignedInt(0xff))
    }
    
    public var red: UInt8 {
        
        return UInt8((self.value >> 16) & CUnsignedInt(0xff))
    }
    
    public var green: UInt8 {
        
        return UInt8((self.value >> 8)  & CUnsignedInt(0xff))
    }
    
    public var blue: UInt8 {
        
        return UInt8((self.value)       & CUnsignedInt(0xff))
    }
    
    // MARK: - Constants
    
    public static let white     = Color(0xffffff)
    public static let silver    = Color(0xc0c0c0)
    public static let gray      = Color(0x808080)
    public static let black     = Color(0x000000)
    public static let red       = Color(0xff0000)
    public static let maroon    = Color(0x800000)
    public static let yellow    = Color(0xffff00)
    public static let olive     = Color(0x808000)
    public static let lime      = Color(0x00ff00)
    public static let green     = Color(0x008000)
    public static let aqua      = Color(0x00ffff)
    public static let teal      = Color(0x008080)
    public static let blue      = Color(0x0000ff)
    public static let navy      = Color(0x000080)
    public static let fuchsia   = Color(0xff00ff)
    public static let purple    = Color(0x800080)
}

// MARK: - Equatable

public func == (lhs: Color, rhs: Color) -> Bool {
    
    return lhs.value == rhs.value
}

public extension Color {
    
    /// Performs equality without comparing alpha values.
    func equalColor(rhs: Color) -> Bool {
        
        return (self.value & 0xffffff) == (rhs.value & 0xffffff)
    }
}