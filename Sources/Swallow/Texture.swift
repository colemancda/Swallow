//
//  Texture.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/23/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import OpenGLES
#endif

/// Represents a texture, an in-memory representation of an image in a compatible format the 
/// graphics processor can process.
///
/// Allows to create OpenGL textures from image files, text (font rendering) and raw data.
///
/// - Note: Be aware that the content of the generated texture will be upside-down! This is an OpenGL oddity.
public struct Texture {
    
    public let name: GLuint
    
    // MARK: - Initialization
    
    public init(data: [UInt8], pixelFormat: PixelFormat = PixelFormat(), pixelSize: (width: UInt, height: UInt), contentSize: Size) {
        
        // FIXME: 32 bits or POT textures uses UNPACK of 4 (is this correct ??? )
        if pixelFormat == .RGBA8888 || pixelFormat == .BGRA8888 || (pixelSize.width.nextPowerOfTwo == pixelSize.width && pixelSize.height.nextPowerOfTwo == pixelSize.height) {
            
            glPixelStorei(GLenum(GL_UNPACK_ALIGNMENT), 4)
        
        } else {
            
            glPixelStorei(GLenum(GL_UNPACK_ALIGNMENT), 1)
        }
        
        var name: GLuint = 0
        
        glGenTextures(1, &name)
        glBindTexture(GLenum(GL_TEXTURE_2D), name)
        
        assert(name != 0)
        
        glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_MIN_FILTER), GLint(GL_LINEAR))
        glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_MAG_FILTER), GLint(GL_LINEAR))
        glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_WRAP_S), GLint(GL_CLAMP_TO_EDGE))
        glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_WRAP_T), GLint(GL_CLAMP_TO_EDGE))
        
        // Specify OpenGL texture image
        
        let glInternalFormat: CInt
        
        let glFormat: CInt
        
        let glType: CInt
        
        switch pixelFormat {
            
        case .RGBA8888: glFormat = GL_RGBA; glType = GL_UNSIGNED_BYTE
            
        case .BGRA8888: glFormat = GL_RGBA; glType = GL_UNSIGNED_BYTE
            
        case .RGBA4444: glFormat = GL_RGBA; glType = GL_UNSIGNED_BYTE
        }
    }
}