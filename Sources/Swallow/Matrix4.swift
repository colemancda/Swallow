//
//  Matrix4.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/20/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/** A 4x4 matrix.

- Note: m30, m31, and m32 correspond to the translation values tx, ty, and tz, respectively.
m[12], m[13], and m[14] correspond to the translation values tx, ty, and tz, respectively.
*/
public struct Matrix4 {
    
    // MARK: - Value
    
    public var value: (Float, Float, Float, Float, Float, Float, Float, Float, Float, Float, Float, Float, Float, Float, Float, Float)
    
    // MARK: - Initialization
    
    public init(_ m0: (Float, Float, Float, Float),
                _ m1: (Float, Float, Float, Float),
                _ m2: (Float, Float, Float, Float),
                _ m3: (Float, Float, Float, Float))
    {
        self.value = (m0.0, m0.1, m0.2, m0.3,
                      m1.0, m1.1, m1.2, m1.3,
                      m2.0, m2.1, m2.2, m2.3,
                      m3.0, m3.1, m3.2, m3.3)
    }
    
    public static let Identity = Matrix4((0,0,0,0), (0,0,0,0), (0,0,0,0), (0,0,0,0))
    
    // MARK: - Accessors
    
    public var m00: Float {
        
        get { return value.0 }
        set { value.0 = newValue }
    }
    
    public var m01: Float {
        
        get { return value.1 }
        set { value.1 = newValue }
    }
    
    public var m02: Float {
        
        get { return value.2 }
        set { value.2 = newValue }
    }
    
    public var m03: Float {
        
        get { return value.3 }
        set { value.3 = newValue }
    }
    
    public var m10: Float {
        
        get { return value.4 }
        set { value.4 = newValue }
    }
    
    public var m11: Float {
        
        get { return value.5 }
        set { value.5 = newValue }
    }
    
    public var m12: Float {
        
        get { return value.6 }
        set { value.6 = newValue }
    }
    
    public var m13: Float {
        
        get { return value.7 }
        set { value.7 = newValue }
    }
    
    public var m20: Float {
        
        get { return value.8 }
        set { value.8 = newValue }
    }
    
    public var m21: Float {
        
        get { return value.9 }
        set { value.9 = newValue }
    }
    
    public var m22: Float {
        
        get { return value.10 }
        set { value.10 = newValue }
    }
    
    public var m23: Float {
        
        get { return value.11 }
        set { value.11 = newValue }
    }
    
    public var m30: Float {
        
        get { return value.12 }
        set { value.12 = newValue }
    }
    
    public var m31: Float {
        
        get { return value.13 }
        set { value.13 = newValue }
    }
    
    public var m32: Float {
        
        get { return value.14 }
        set { value.14 = newValue }
    }
    
    public var m33: Float {
        
        get { return value.15 }
        set { value.15 = newValue }
    }
    
    // MARK: - Subscripting
    
    public subscript (index: Int) -> Float {
        
        get {
            
            switch index {
                
            case  0: return value.0
            case  1: return value.1
            case  2: return value.2
            case  3: return value.3
            case  4: return value.4
            case  5: return value.5
            case  6: return value.6
            case  7: return value.7
            case  8: return value.8
            case  9: return value.9
            case 10: return value.10
            case 11: return value.11
            case 12: return value.12
            case 13: return value.13
            case 14: return value.14
            case 15: return value.15
                
            default: fatalError("Invalid index \(index)")
            }
        }
        
        set {
            
            switch index {
                
            case  0: value.0  = newValue
            case  1: value.1  = newValue
            case  2: value.2  = newValue
            case  3: value.3  = newValue
            case  4: value.4  = newValue
            case  5: value.5  = newValue
            case  6: value.6  = newValue
            case  7: value.7  = newValue
            case  8: value.8  = newValue
            case  9: value.9  = newValue
            case 10: value.10 = newValue
            case 11: value.11 = newValue
            case 12: value.12 = newValue
            case 13: value.13 = newValue
            case 14: value.14 = newValue
            case 15: value.15 = newValue
                
            default: fatalError("Invalid index \(index)")
            }
        }
    }
}

// MARK: - Math

public extension Matrix4 {
    
    public mutating func multiply(lhs: Matrix4) {
        
        var m = Matrix4.Identity
        
        m[0]  = lhs[0] * self[0]  + lhs[4] * self[1]  + lhs[8] * self[2]   + lhs[12] * self[3];
        m[4]  = lhs[0] * self[4]  + lhs[4] * self[5]  + lhs[8] * self[6]   + lhs[12] * self[7];
        m[8]  = lhs[0] * self[8]  + lhs[4] * self[9]  + lhs[8] * self[10]  + lhs[12] * self[11];
        m[12] = lhs[0] * self[12] + lhs[4] * self[13] + lhs[8] * self[14]  + lhs[12] * self[15];
        
        m[1]  = lhs[1] * self[0]  + lhs[5] * self[1]  + lhs[9] * self[2]   + lhs[13] * self[3];
        m[5]  = lhs[1] * self[4]  + lhs[5] * self[5]  + lhs[9] * self[6]   + lhs[13] * self[7];
        m[9]  = lhs[1] * self[8]  + lhs[5] * self[9]  + lhs[9] * self[10]  + lhs[13] * self[11];
        m[13] = lhs[1] * self[12] + lhs[5] * self[13] + lhs[9] * self[14]  + lhs[13] * self[15];
        
        m[2]  = lhs[2] * self[0]  + lhs[6] * self[1]  + lhs[10] * self[2]  + lhs[14] * self[3];
        m[6]  = lhs[2] * self[4]  + lhs[6] * self[5]  + lhs[10] * self[6]  + lhs[14] * self[7];
        m[10] = lhs[2] * self[8]  + lhs[6] * self[9]  + lhs[10] * self[10] + lhs[14] * self[11];
        m[14] = lhs[2] * self[12] + lhs[6] * self[13] + lhs[10] * self[14] + lhs[14] * self[15];
        
        m[3]  = lhs[3] * self[0]  + lhs[7] * self[1]  + lhs[11] * self[2]  + lhs[15] * self[3];
        m[7]  = lhs[3] * self[4]  + lhs[7] * self[5]  + lhs[11] * self[6]  + lhs[15] * self[7];
        m[11] = lhs[3] * self[8]  + lhs[7] * self[9]  + lhs[11] * self[10] + lhs[15] * self[11];
        m[15] = lhs[3] * self[12] + lhs[7] * self[13] + lhs[11] * self[14] + lhs[15] * self[15];
        
        self = m
    }
}

// MARK: - Darwin Support

#if os(iOS) || os(tvOS)
    
    import GLKit
    
    extension Matrix4: UIKitConvertible {
        
        public init(_ GLKitValue: GLKMatrix4) {
            
            self.value = GLKitValue.m
        }
        
        public func toUIKit() -> GLKMatrix4 {
            
            return GLKMatrix4(m: self.value)
        }
    }
    
#endif

