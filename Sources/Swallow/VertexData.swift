//
//  VertexData.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/20/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/** Manages a raw list of vertex information, allowing direct upload
to OpenGL vertex buffers.

To render objects with OpenGL, you have to organize vertex data in so-called
vertex buffers. Those buffers reside in graphics memory and can be accessed very
efficiently by the GPU. Before you can move data into vertex buffers, you have to
set it up in conventional memory - that is, in a byte array. That array contains
all vertex information (the coordinates, color, and texture coordinates) - one
vertex after the other.

To simplify creating and working with such a bulky list, `VertexData` was
created. It contains methods to specify and modify vertex data. The raw array managed
by the class can then easily be uploaded to a vertex buffer.

- Note: You only have to work with this class if you create display objects with a custom render
function. If you don't plan to do that, you can safely ignore it.

**Premultiplied Alpha**

The color values of texture files may contain premultiplied alpha values, which
means that the `RGB` values were multiplied with the `alpha` value
before saving them. On rendering, it makes a difference in which way the alpha value is saved;
for that reason, the VertexData class mimics this behavior. You can choose how the alpha
values should be handled via the `premultipliedAlpha` property.

*/
public struct VertexData {
    
    // MARK: - Properties
    
    public var vertices: [Vertex]
    
    public var premultipliedAlpha: Bool {
        
        willSet {
            
            guard newValue != self.premultipliedAlpha else { return }
            
            
        }
    }
    
    // MARK: - Initialization
    
    public init(vertices: [Vertex] = [], premultipliedAlpha: Bool = false) {
        
        self.vertices = vertices
        self.premultipliedAlpha = false
    }
    
    // MARK: - Methods
    
    /// Transforms the vertex position of this instance by a certain matrix and copies the result to
    /// another VertexData instance. Limit the operation to a range of vertices via the `fromIndex` and
    /// `numVertices` parameters.
    public func copy(inout target: VertexData, atIndex targetIndex: Int = 0, matrix: Matrix? = nil, fromIndex: Int = 0, count: Int? = nil) {
        
        let numVertices = count ?? self.vertices.count
        
        
    }
}

