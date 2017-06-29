//
//  CompositeRenderable.swift
//  GraphicsTools
//
//  Created by James Bean on 6/27/17.
//
//

import PathTools

/// Type which represents a composite of `ConfiguredRenderable`-type values.
public protocol CompositeRenderable: Renderable {
    var components: [Renderable] { get }
}

extension CompositeRenderable {
    
    public var rendered: StyledPath.Composite {
        return .branch(StyledPath.Group("root"), components.map { $0.rendered })
    }
}
