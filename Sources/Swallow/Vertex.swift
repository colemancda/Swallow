//
//  Vertex.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Kronos

public struct Vertex {
    
    // MARK: - Properties
    
    public var position: Vector2
    
    public var textureCoordinates: Vector2
    
    public var color: VertexColor
    
    // MARK: - Initialization
    
    public init(position: Vector2, textureCoordinates: Vector2, color: VertexColor) {
        
        self.position = position
        self.textureCoordinates = textureCoordinates
        self.color = color
    }
}