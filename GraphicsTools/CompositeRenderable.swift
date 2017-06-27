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
    var renderables: [Renderable] { get }
}

extension CompositeRenderable {
    
    public func render() -> StyledPath.Composite {
        return .branch(StyledPath.Group(identifier: "root"), renderables.map { $0.rendered })
    }
}
