//
//  Context.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/18/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Kronos

/// Manages the state information, commands, and resources needed to draw using
/// OpenGL. All OpenGL commands are executed in relation to a context. `Context` wraps the native
/// context and provides additional functionality.
public final class Context {
    
    // MARK: - Properties
    
    public let nativeContext: NativeContext
    
    /*
    public var backBufferWidth: Int {
        
        return backBuffer.width
    }
    
    public var backBufferHeight: Int {
        
        return backBuffer.height
    }*/
    
    // MARK: - Private Properties
    
    //private let renderTexture: GLTexture?
    
    internal var backBuffer: Framebuffer?
    
    // MARK: - Initialization
    
    public init(nativeContext: NativeContext) {
        
        self.nativeContext = nativeContext
    }
    
    // MARK: - Methods
    
    public func clear(red red: Float, green: Float, blue: Float, alpha: Float, depth: Float = 1, stencil: UInt = 0, mask: [ClearMask] = [.Color, .Depth, .Stencil]) {
        
        let scissorEnabled = Capability.ScissorTest.enabled
        
        if scissorEnabled {
            
            Capability.ScissorTest.disable()
        }
        
        glClearColor(red, green, blue, alpha)
        glClearDepthf(depth)
        glClearStencil(GLint(stencil))
        
        ClearMask.clear(mask)
        
        if scissorEnabled {
            
            Capability.ScissorTest.enable()
        }
    }
    
    
}


