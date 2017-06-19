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

// FIXME: Use extension StyledPath.Composite { } when / if Swift allows it.
extension Tree where Branch == StyledPath.Group, Leaf == StyledPath {
    
}

extension StyledPath.Group {
    
    init(_ svgGroup: SVG.Group) {
        self.init(identifier: svgGroup.identifier)
    }
}
