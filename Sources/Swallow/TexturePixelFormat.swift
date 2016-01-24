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
    
    var glTexImage2D: (internalFormat: GLint, format: GLenum, type: GLenum) {
        
        let internalFormat: CInt
        let format: CInt
        let type: CInt
        
        switch self {
            
        case .RGBA8888:
            internalFormat = GL_RGBA
            format = GL_RGBA
            type = GL_UNSIGNED_BYTE
            
        case .BGRA8888:
            internalFormat = GL_RGBA
            format = GL_BGRA
            type = GL_UNSIGNED_BYTE
            
        case .RGBA4444:
            internalFormat = GL_RGBA
            format = GL_RGBA
            type = GL_UNSIGNED_SHORT_4_4_4_4
            
        case .RGB5A1:
            internalFormat = GL_RGBA
            format = GL_RGBA
            type = GL_UNSIGNED_SHORT_5_5_5_1
            
        case .RGB565:
            internalFormat = GL_RGB
            format = GL_RGB
            type = GL_UNSIGNED_SHORT_5_6_5
            
        case .AI88:
            internalFormat = GL_LUMINANCE_ALPHA
            format = GL_LUMINANCE_ALPHA
            type = GL_UNSIGNED_BYTE
            
        case .A8:
            internalFormat = GL_ALPHA
            format = GL_ALPHA
            type = GL_UNSIGNED_BYTE
        }
        
        return (GLint(internalFormat), GLenum(format), GLenum(type))
    }
}