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

extension Line: SVGInitializable {
    
    init(svgElement: SVGElement) throws {
        
        guard
            let x1: Double = svgElement.value(ofAttribute: "x1"),
            let y1: Double = svgElement.value(ofAttribute: "y1"),
            let x2: Double = svgElement.value(ofAttribute: "x2"),
            let y2: Double = svgElement.value(ofAttribute: "y2")
        else {
            throw SVG.Parser.Error.illFormedLine(svgElement)
        }
        
        self.init(start: Point(x: x1, y: y1), end: Point(x: x2, y: y2))
    }
}

extension Polyline: SVGInitializable {
    
    init(svgElement: SVGElement) throws {
        
        guard let pointsString: String = svgElement.value(ofAttribute: "points") else {
            throw SVG.Parser.Error.illFormedPolyline(svgElement)
        }
        
        let points = pointsString
            .components(separatedBy: " ").filter { $0 != "" }
            .flatMap { Point(string: $0) }
        
        self.init(points)
    }
}

extension Rectangle: SVGInitializable {
    
    init(svgElement: SVGElement) throws {
        
        guard
            let x: Double = svgElement.value(ofAttribute: "x"),
            let y: Double = svgElement.value(ofAttribute: "y"),
            let width: Double = svgElement.value(ofAttribute: "width"),
            let height: Double = svgElement.value(ofAttribute: "height")
        else {
            throw SVG.Parser.Error.illFormedRectangle(svgElement)
        }
        
        self.init(origin: Point(x: x, y: y), size: Size(width: width, height: height))
    }
}

extension Circle: SVGInitializable {
    
    init(svgElement: SVGElement) throws {
        
        guard
            let x: Double = svgElement.value(ofAttribute: "cx"),
            let y: Double = svgElement.value(ofAttribute: "cy"),
            let radius: Double = svgElement.value(ofAttribute: "r")
        else {
            throw SVG.Parser.Error.illFormedCircle(svgElement)
        }
        
        self.init(center: Point(x: x, y: y), radius: radius)
    }
}

extension Ellipse: SVGInitializable {
    
    init(svgElement: SVGElement) throws {
        
        guard
            let x: Double = svgElement.value(ofAttribute: "cx"),
            let y: Double = svgElement.value(ofAttribute: "cy"),
            let radiusX: Double = svgElement.value(ofAttribute: "rx"),
            let radiusY: Double = svgElement.value(ofAttribute: "ry")
        else {
            throw SVG.Parser.Error.illFormedEllipse(svgElement)
        }
        
        self.init(
            center: Point(x: x, y: y),
            size: Size(width: 2 * radiusX, height: 2 * radiusY)
        )
    }
}

extension Styling: SVGInitializable {
    
    init(svgElement: SVGElement) throws {
        let fill = try Fill(svgElement: svgElement)
        let stroke = try Stroke(svgElement: svgElement)
        self.init(fill: fill, stroke: stroke)
    }
}

extension Fill: SVGInitializable {
    
    init(svgElement: SVGElement) throws {
        let color: String = svgElement.value(ofAttribute: "fill") ?? "#FFFFFF"
        let rule: String = svgElement.value(ofAttribute: "fill-rule") ?? "nonZero"
        self.init(color: Color.red, rule: .nonZero)
    }
}

extension Stroke: SVGInitializable {
    
    init(svgElement: SVGElement) throws {

        let color: String = svgElement.value(ofAttribute: "stroke") ?? "#FFFFFF"
        let opacity: Double = svgElement.value(ofAttribute: "opacity") ?? 1
        let width: Double = svgElement.value(ofAttribute: "stroke-width") ?? 1
        let miter: Double = svgElement.value(ofAttribute: "miter-limit") ?? 10
        let lineJoinString: String = svgElement.value(ofAttribute: "stroke-linejoin") ?? "butt"
        
        self.init(width: width, color: .red, join: .miter(limit: 10), cap: .butt, dashes: nil)
    }
}
