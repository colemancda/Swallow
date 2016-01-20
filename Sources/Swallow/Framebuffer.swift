//
//  Framebuffer.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// This class holds information about framebuffer objects bound to texture or drawable objects.
internal final class Framebuffer {
    
    // MARK: - Properties
    
    internal var antiAlias: CInt {
        
        didSet {
            
            if oldValue != antiAlias {
                
                shouldDestroyFrameBuffer = true
            }
        }
    }
    
    internal var enableDepthAndStencil: Bool {
        
        didSet {
            
            if oldValue != enableDepthAndStencil {
                
                shouldDestroyFrameBuffer = true
            }
        }
    }
    
    internal private(set) var width: CInt = 0
    
    internal private(set) var height: CInt = 0
    
    // MARK: - Private Properties
    
    private weak var context: Context!
    
    private var shouldDestroyFrameBuffer = false
    
    private var needsFinish = false
    
    // MARK: - Initializer
    
    internal init() {
        
        fatalError()
    }
    
    // MARK: - Methods
    
    func present() -> Bool {
        
        // TODO: Implement -present:
        /*
        self.resolve()
        self.discard()
        
        if needsFinish {
            
            glFinish()
            
            needsFinish = false
        }
        
        glBindRenderbuffer(GLenum(GL_RENDERBUFFER), _colorRenderBuffer)
        */
        return context.nativeContext.presentRenderbuffer(Int(GL_RENDERBUFFER))
    }
}