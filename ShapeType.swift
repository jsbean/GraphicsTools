//
//  ShapeType.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore

public protocol ShapeType: Buildable, PathMaking, FrameMaking {
    
    var frame: CGRect { get set }
    var path: CGPath? { get set }
}

extension ShapeType {
    
    public func build() {
        frame = makeFrame()
        path = makePath()
    }
}
