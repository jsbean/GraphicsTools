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
        let path = try Path.makePath(svgElement: svgElement)
        // FIXME: Extract styling
        self.init(path: path, styling: Styling())
    }
}
