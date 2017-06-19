//
//  Polygon+SVG.swift
//  GraphicsTools
//
//  Created by James Bean on 6/19/17.
//
//

import GeometryTools
import PathTools

extension Polygon: SVGInitializable {
    
    init(svgElement: SVGElement) throws {
        
        guard let pointsString: String = svgElement.value(ofAttribute: "points") else {
            throw SVG.Parser.Error.illFormedPolygon(svgElement)
        }
        
        let pointStrings = pointsString.components(separatedBy: " ").filter { $0 != "" }
        let points = pointStrings.flatMap(Point.init)
        
        print("points: \(points)")
        
        self.init(vertices: points)
    }
}

extension Polygon: PathRepresentable {
    
    public var path: Path {
        return Path(self)
    }
}
