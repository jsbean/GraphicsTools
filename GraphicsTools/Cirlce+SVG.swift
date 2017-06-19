//
//  Cirlce+SVG.swift
//  GraphicsTools
//
//  Created by James Bean on 6/19/17.
//
//

import GeometryTools

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
