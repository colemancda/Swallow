//
//  RenderingAPI.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Defines values that a rendering context provides.
public enum RenderingAPI: Int {
    
    case OpenGLES2 = 1
    case OpenGLES3 = 2
}

// MARK: - Darwin Support

#if os(iOS) || tvOS
    
    import GLKit
    import OpenGLES
    
    public extension RenderingAPI {
        
        init?(_ EAGLValue: EAGLRenderingAPI) {
            
            switch EAGLValue {
                
            case .OpenGLES1: return nil
            case .OpenGLES2: self = .OpenGLES2
            case .OpenGLES3: self = .OpenGLES3
            }
        }
        
        var EAGLValue: EAGLRenderingAPI {
            
            switch self {
                
            case .OpenGLES2: return .OpenGLES2
            case .OpenGLES3: return .OpenGLES3
            }
        }
    }
    
#endif