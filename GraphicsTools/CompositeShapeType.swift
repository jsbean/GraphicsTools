//
//  CompositeShapeType.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore

/**
 For graphical objects that contain other `ShapeType`.
 */
public protocol CompositeShapeType: GraphicsContainerType { }

extension CompositeShapeType where Self: CALayer {
    
    // MARK: - Instance Methods
    
    /**
     Perform the build phase.
     */
    public func build() {
        frame = makeFrame()
        createComponents()
        commitComponents()
    }

    /**
     Commit the components as sublayers.
     */
    public func commitComponents() {
        components.forEach(addSublayer)
    }
}
