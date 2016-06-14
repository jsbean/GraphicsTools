//
//  CompositeShapeType.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore

public protocol CompositeShapeType: GraphicsContainerType { }

extension CompositeShapeType {
    
    public func build() {
        frame = makeFrame()
        createComponents()
        commitComponents()
    }

    public func commitComponents() {
        components.forEach { addSublayer($0) }
    }
}
