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

    public var frame: Rectangle {
        switch self {
        case .leaf(let styledPath):
            return styledPath.frame
        case .branch(let group, _):
            return group.frame
        }
    }

    public var resizedToFitContents: StyledPath.Composite {

        switch self {

        case .leaf(let styledPath):
            let styledPath = styledPath.resizedToFitContents
            let frame = styledPath.frame
            return .leaf(styledPath.translated(by: -frame.origin))

        case let .branch(group, trees):
            let frame = trees.map { $0.frame }.sum
            let group = StyledPath.Group(group.identifier, frame: frame)
            return .branch(group, trees.map { $0.translated(by: -frame.origin) })
        }
    }

    public var axisAlignedBoundingBox: Rectangle {

        switch self {

        case .leaf(let styledPath):
            return styledPath
                .path
                .axisAlignedBoundingBox
                .translated(by: -styledPath.frame.origin)

        case let .branch(group, trees):
            return trees
                .map { composite in composite.axisAlignedBoundingBox }
                .sum
                .translated(by: -group.frame.origin)
        }
    }

    public func translated(by point: Point) -> StyledPath.Composite {
        switch self {
        case let .leaf(styledPath):
            return .leaf(styledPath.translated(by: point))
        case let .branch(group, trees):
            let group = StyledPath.Group(group.identifier, frame: group.frame.translated(by: point))
            return .branch(group, trees)
        }
    }
}
