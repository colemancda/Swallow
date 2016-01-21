//
//  Vector3.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/20/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// A representation of a 3-component vector.
public struct Vector3 {
    
    // MARK: - Properties
    
    public var value: (Float, Float, Float)
    
    // MARK: - Initialization
    
    public init(_ x: Float, _ y: Float, _ z: Float) {
        
        self.value = (x, y, z)
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
    
    public var z: Float {
        
        get { return value.2 }
        set { value.2 = newValue }
    }
    
    public var s: Float {
        
        get { return value.0 }
        set { value.0 = newValue }
    }
    
    public var t: Float {
        
        get { return value.1 }
        set { value.1 = newValue }
    }
    
    public var p: Float {
        
        get { return value.2 }
        set { value.2 = newValue }
    }
    
    // MARK: - Subscripting
    
    public subscript (index: Int) -> Float {
        
        get {
            
            switch index {
                
            case 0: return value.0
            case 1: return value.1
            case 2: return value.2
                
            default: fatalError("Invalid index \(index)")
            }
        }
        
        set {
            
            switch index {
                
            case 0: value.0 = newValue
            case 1: value.1 = newValue
            case 2: value.2 = newValue
                
            default: fatalError("Invalid index \(index)")
            }
        }
    }
}

// MARK: - Darwin Support

#if os(iOS) || os(tvOS)
    
    import GLKit
    
    extension Vector3: UIKitConvertible {
        
        public init(_ GLKitValue: GLKVector3) {
            
            self.value = GLKitValue.v
        }
        
        public func toUIKit() -> GLKVector3 {
            
            return GLKVector3(v: self.value)
        }
    }
    
#endif
