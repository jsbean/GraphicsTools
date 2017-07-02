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
    var rendered: StyledPath.Composite { get }
    var components: [Renderable] { get }
}

extension CompositeRenderable {
    
    public var rendered: StyledPath.Composite {

        let paths = components.map { $0.rendered }

        let frame = paths
            .lazy
            .flatMap { $0.leaves.map { $0.path.axisAlignedBoundingBox } }
            .sum

        let translated = paths
            .flatMap { $0.leaves.map { $0.translated(by: -2 * frame.origin) } }
            .map { StyledPath.Composite.leaf($0) }

        print("bbox: \(frame)")

        // For now, flatten everything, assume that each sub-group's frame is `.zero`
        return .branch(StyledPath.Group("root", frame: frame), translated)
    }
}
