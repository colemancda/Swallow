//
//  ScaleMode.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/19/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Provides constant values for the `Rectangle.fitInto()` method.
public enum ScaleMode {
    
    /// Specifies that the rectangle is not scaled, but simply centered within the specified area.
    case None
    
    /// Specifies that the rectangle fills the specified area without distortion but possibly
    /// with some cropping, while maintaining the original aspect ratio.
    case NoBorder
    
    /// Specifies that the entire rectangle will be scaled to fit into the specified area,
    /// while maintaining the original aspect ratio. This might leave empty bars at either the
    /// top and bottom, or left and right.
    case ShowAll
}