//
//  CompositeShapeType.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore

/// Interface for graphical objects that contain other `ShapeType`.
public protocol CompositeShapeType: GraphicsContainerType { }

extension CompositeShapeType where Self: CALayer {
    
    // MARK: - Instance Methods
    
    /// Perform the build phase.
    public func build() {
        createComponents()
        commitComponents()
        frame = makeFrame()
    }

    /// Commit the components as sublayers.
    public func commitComponents() {
        components.forEach(addSublayer)
    }
}
