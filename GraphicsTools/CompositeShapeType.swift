//
//  CompositeShapeType.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore

/// Interface for graphical objects that contain other `ShapeType`.
///
/// - TODO: Remove dependency on `Quartz`, use GraphicsTools primitives.
///
public protocol CompositeShapeType: GraphicsContainerType { }

extension CompositeShapeType where Self: CALayer {
    
    // MARK: - Instance Methods
    
    /// Perform the build phase.
    public func build() {
        print("CompositeShapeType is deprecated in 0.6")
        frame = makeFrame()
        createComponents()
        commitComponents()
    }

    /// Commit the components as sublayers.
    public func commitComponents() {
        print("CompositeShapeType is deprecated in 0.6")
        components.forEach(addSublayer)
    }
}
