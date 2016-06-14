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
public protocol ShapeType: Buildable, PathMaking, FrameMaking { }

extension ShapeType where Self: CAShapeLayer {
    
    /**
     Perform the build phase.
     */
    public func build() {
        frame = makeFrame()
        path = makePath()
    }
}
