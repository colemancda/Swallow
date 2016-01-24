//
//  Size.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/24/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// A structure that contains width and height values.
public struct Size {
    
    // MARK: - Properties
    
    public var width: Float
    
    public var height: Float
    
    // MARK: - Initialization
    
    public init(width: Float = 0, height: Float = 0) {
        
        self.width = width
        self.height = height
    }
}