//
//  StyledPath.Composite.swift
//  GraphicsTools
//
//  Created by James Bean on 6/27/17.
//
//

import Collections
import GeometryTools

extension StyledPath {
    
    public struct Group {
        
        public let identifier: String
        public let frame: Rectangle
        
        public init(_ identifier: String = "root", frame: Rectangle = .zero) {
            self.identifier = identifier
            self.frame = frame
        }
    }
    
    public typealias Composite = Tree<Group,StyledPath>
}

// TODO: Use extension StyledPath.Composite when Swift allows it.
extension Tree where Branch == StyledPath.Group, Leaf == StyledPath {

    public var axisAlignedBoundingBox: Rectangle {
        switch self {
        case .leaf(let styledPath):
            return styledPath.path.axisAlignedBoundingBox.translated(by: -styledPath.frame.origin)
        case .branch:
            fatalError()
        }
    }
}
