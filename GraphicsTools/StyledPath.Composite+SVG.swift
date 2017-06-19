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
    
    init(_ svg: SVG) {
        
//        let t = Tree.Transform<StyledPath.Group, StyledPath>(
//            leaf: { leaf in leaf },
//            branch: { branch in branch }
//        )

        let frame = svg.viewBox
        
        let leafMap: (StyledPath) -> StyledPath = { path in path }
        let branchMap: (SVG.Group) -> StyledPath.Group = { group in StyledPath.Group(group) }
        let composite = svg.structure.map(Transform(leaf: leafMap, branch: branchMap))
        
//        
//        let composite = svg.structure.map(Transform<SVG.Group, StyledPath>(leaf: { _ in StyledPath() }, branch: { _ in SVG.Group(identifier: "") }))
        
    }
}

extension StyledPath.Group {
    
    init(_ svgGroup: SVG.Group) {
        self.init(identifier: svgGroup.identifier)
    }
}
