//
//  Point3D.swift
//  Swallow
//
//  Created by Alsey Coleman Miller on 1/21/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/**
Represents a point or a location in the three-dimensional space using the
Cartesian coordinates `x`, `y`, and `z`. As in a two-dimensional space, the `x` property represents the
horizontal axis and the `y` property represents the vertical axis. In three-dimensional space, the z
property represents depth.

The value of the `x` property increases as the object moves to the right.
The value of the `y` property increases as the object moves down.
The `z` property increases as the object moves farther from the point of view.

Using perspective projection and scaling, the object is seen to be bigger when near and smaller
when farther away from the screen. As in a right-handed three-dimensional coordinate system, the
positive z-axis points away from the viewer and the value of the `z` property increases as the object
moves away from the viewer's eye. The origin point `(0,0,0)` of the global space is the upper-left
corner of the stage.
*/
public struct Point3D {
    
    public var vector: Vector4
}