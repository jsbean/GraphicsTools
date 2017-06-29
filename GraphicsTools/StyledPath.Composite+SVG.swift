//
//  StyledPath.Composite+SVG.swift
//  GraphicsTools
//
//  Created by James Bean on 6/19/17.
//
//

import Collections
import GeometryTools
import PathTools
import QuartzCore

extension StyledPath.Group {
    
    init(_ svgGroup: SVG.Group) {
        self.init(svgGroup.identifier)
    }
}
