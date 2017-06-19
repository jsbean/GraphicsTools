//
//  StyledPath+SVG.swift
//  GraphicsTools
//
//  Created by James Bean on 6/19/17.
//
//

import Collections
import PathTools

extension StyledPath {
    
    init(svgElement: SVGElement) throws {
        self.init(
            path: try Path.makePath(svgElement: svgElement),
            styling: try Styling(svgElement: svgElement)
        )
    }
}
