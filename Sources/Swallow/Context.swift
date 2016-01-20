//
//  Context.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/18/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

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
    
    public func clear(red red: Float, green: Float, blue: Float, alpha: Float, depth: Float = 1, stencil: UInt = 0, mask: [ClearMask] = []) {
        
        let scissorEnabled = glIsEnabled(GLenum(GL_SCISSOR_TEST))
        
        if scissorEnabled {
            
            glDisable(GLenum(GL_SCISSOR_TEST))
        }
        
        glClearColor(red, green, blue, alpha)
        glClearDepthf(depth)
        glClearStencil(GLint(stencil))
        
        var glMask: GLbitfield = 0
        
        if mask.contains(.Color) {
            
            glMask |= GLbitfield(GL_COLOR_BUFFER_BIT)
        }
        
        if mask.contains(.Depth) {
            
            glMask |= GLbitfield(GL_DEPTH_BUFFER_BIT)
        }
        
        if mask.contains(.Stencil) {
            
            glMask |= GLbitfield(GL_STENCIL_BUFFER_BIT)
        }
        
        glClear(glMask)
        
        if scissorEnabled {
            
            glEnable(GLenum(GL_SCISSOR_TEST))
        }
    }
    
    
}


