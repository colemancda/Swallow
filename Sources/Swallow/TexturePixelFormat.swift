//
//  TexturePixelFormat.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/23/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Possible texture pixel formats. 
///
/// Used by various rendering components, including Texture, RenderTexture, EffectNode.
public extension Texture {
    
    public enum PixelFormat {
        
        /// 32-bit texture: RGBA8888
        case RGBA8888
        
        /// 16-bit texture without Alpha channel
        case RGB565
        
        /// 8-bit texture used as mask
        case A8
        
        /// 8-bit intensity texture
        case I8
        
        /// 16-bit texture used as mask
        case AI88
        
        /// 16-bit texture: RGBA4444
        case RGBA4444
        
        /// 16-bit textures: RGB5A1
        case RGB5A1
        
        /// 32-bit texture: BGRA8888
        case BGRA8888
        
        public init() { self = .RGBA8888 }
    }
}

// MARK: - Internal

internal extension Texture.PixelFormat {
    
    var internalFormat: GLint {
        
        let value: CInt
        
        switch self {
            
        case .RGBA8888: value = GL_RGBA
        case .BGRA8888: value = GL_RGBA
        case .RGBA4444: value = GL_RGBA
        case .RGB5A1:   value = GL_RGBA
        case .RGB565:   value = GL_RGB
        //case .RGB888:   value = GL_RGB // not availible
        case .AI88:     value = GL_LUMINANCE_ALPHA
        case .A8:       value = GL_ALPHA
        }
        
        return GLint(value)
    }
}