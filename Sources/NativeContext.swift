//
//  NativeContext.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/18/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

// MARK: - Protocol Declaration

public protocol NativeContextType: class {
    
    var renderingAPI: RenderingAPI { get }
}

// MARK: - Darwin Support

#if os(iOS) || os(tvOS)
    
    import GLKit
    
    public typealias NativeContext = EAGLContext
    
    extension EAGLContext: NativeContextType {
        
        public var renderingAPI: RenderingAPI {
            
            guard let api = RenderingAPI(API)
                else { fatalError("Invalid EAGLRenderingAPI (\(API)). " +
                    "Only OpenGL ES 2 and above are supported") }
            
            return api
        }
    }
    
#endif

