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
    var rendered: StyledPath.Composite { get }
    var components: [Renderable] { get }
}

extension CompositeRenderable {
    
    public var rendered: StyledPath.Composite {
        let paths = components.map { $0.rendered }
        let bbox = paths.flatMap { $0.leaves.map { $0.path.axisAlignedBoundingBox } }.sum
        print("bbox: \(bbox)")
        return .branch(StyledPath.Group("root"), paths)
    }
}
