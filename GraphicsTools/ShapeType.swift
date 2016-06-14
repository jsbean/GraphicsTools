//
//  ShapeType.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore

/**
 For simple path-based shapes.
 */
public protocol ShapeType: Buildable, PathMaking, FrameMaking {
    
    /// Frame of the object.
    var frame: CGRect { get set }
    
    /// Path of the object.
    var path: CGPath? { get set }
}

extension ShapeType {
    
    /**
     Perform the build phase.
     */
    public func build() {
        frame = makeFrame()
        path = makePath()
    }
}
