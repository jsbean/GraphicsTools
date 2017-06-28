//
//  Shape.swift
//  GraphicsTools
//
//  Created by James Bean on 6/5/17.
//
//

import GeometryTools
import PathTools

/// Interface for `Glyph` values.
public protocol GlyphProtocol {
    
    /// Path of `Glyph`.
    var path: Path { get }
    
    /// Fill of `Glyph`.
    var fill: Fill { get }
    
    /// Stroke of `Glyph`.
    var stroke: Stroke { get }
    
    /// Frame of `Glyph` in parent coordinate space.
    var frame: Rectangle { get }
}

public struct Glyph: GlyphProtocol {
    
    public var frame: Rectangle {
        let boundingBox = path.boundingBox
        let x = position.x - 0.5 * boundingBox.size.width
        let y = position.y - 0.5 * boundingBox.size.height
        return Rectangle(origin: Point(x: x, y: y), size: boundingBox.size)
    }
    
    public let path: Path
    public let fill: Fill
    public let stroke: Stroke
    public let position: Point
    public let anchor: Point
    
    public init(
        path: Path,
        fill: Fill = Fill(),
        stroke: Stroke = Stroke(),
        position: Point = Point(),
        anchor: Point? = nil
    )
    {
        self.path = path
        self.fill = fill
        self.stroke = stroke
        self.position = position
        self.anchor = anchor ?? Point(x: path.boundingBox.midX, y: path.boundingBox.midY)
    }
}

public protocol AtomicGlyph: GlyphProtocol {

    /// Position of `Glyph` in parent coordinate space.
    var position: Point { get }
}

/// Extends `AtomicGlyph` by introducing an internal relative position.
public protocol AnchoredGlyph: AtomicGlyph {
    
    /// Relative point of `position` within own coordinate space.
    var anchor: Point { get }
}

public protocol GlyphComposite { }
public protocol ScalingGlyph: GlyphComposite { }
