//
//  SVGInitializable.swift
//  GraphicsTools
//
//  Created by James Bean on 6/17/17.
//
//

import Collections
import GeometryTools
import PathTools

/// Interface for types which can be initialized with an `SVG` element
protocol SVGInitializable {
    init(svgElement: SVGElement) throws
}

