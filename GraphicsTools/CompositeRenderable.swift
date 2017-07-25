//
//  CompositeRenderable.swift
//  GraphicsTools
//
//  Created by James Bean on 6/27/17.
//
//

import ArithmeticTools
import GeometryTools
import PathTools

/// Type which represents a composite of `ConfiguredRenderable`-type values.
public protocol CompositeRenderable: Renderable {
    var rendered: Composite { get }
    var components: [Renderable] { get }
}

extension CompositeRenderable {
    
    public var rendered: Composite {
        return .branch(Group("container"), components.map { $0.rendered })
    }
}
