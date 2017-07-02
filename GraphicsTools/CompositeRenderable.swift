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
        let frame = paths.lazy.flatMap { $0.leaves.map { $0.path.axisAlignedBoundingBox } }.sum
        //let translated = paths.map { $0.leaves.map { $0.translated(by: -bbox.origin) } }

        print("bbox: \(frame)")
        return .branch(StyledPath.Group("root", frame: frame), paths)
    }
}
