//
//  Vector2.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// A representation of a 2-component vector.
public struct Vector2 {
    
    // MARK: - Properties
    
    public var value: (Float, Float)
    
    // MARK: - Initialization
    
    public init(_ x: Float, _ y: Float) {
        
        self.value = (x, y)
    }
    
    // MARK: - Accessors
    
    public var x: Float {
        
        get { return value.0 }
        
        set { value.0 = newValue }
    }
    
    public var y: Float {
        
        get { return value.1 }
        
        set { value.1 = newValue }
    }
    
    public var s: Float {
        get { return value.0 }
        
        set { value.0 = newValue }
    }
    
    public var t: Float {
        get { return value.1 }
        
        set { value.1 = newValue }
    }
    
    public subscript (index: Int) -> Float {
        
        get {
            
            switch index {
                
            case 0: return value.0
                
            case 1: return value.1
                
            default: fatalError("Invalid index \(index)")
            }
        }
        
        set {
            
            switch index {
                
            case 0: value.0 = newValue
                
            case 1: value.1 = newValue
                
            default: fatalError("Invalid index \(index)")
            }
        }
    }
}

// MARK: - Darwin Support

#if os(iOS) || os(tvOS)
    
    import GLKit
    
    extension Vector2: UIKitConvertible {
        
        public init(_ GLKitValue: GLKVector2) {
            
            self.value = GLKitValue.v
        }
        
        public func toUIKit() -> GLKVector2 {
            
            return GLKVector2(v: self.value)
        }
    }
    
#endif

