////
////  StyledPath.Composite.swift
////  GraphicsTools
////
////  Created by James Bean on 6/27/17.
////
////
//
//import Collections
//import GeometryTools
//
//extension StyledPath {     
//    public typealias Composite = Tree<Group,StyledPath>
//}
//
//// TODO: Use extension StyledPath.Composite when Swift allows it.
//extension Tree where Branch == StyledPath.Group, Leaf == StyledPath {
//
//    public var frame: Rectangle {
//        switch self {
//        case .leaf(let styledPath):
//            return styledPath.frame
//        case .branch(let group, _):
//            return group.frame
//        }
//    }
//
//    public var resizedToFitContents: StyledPath.Composite {
//
//        switch self {
//
//        case .leaf(let styledPath):
//            let resized = styledPath.resizedToFitContents
//            return .leaf(resized.translated(by: -styledPath.frame.origin))
//
//        case let .branch(group, trees):
//            let frame: Rectangle = trees.map { return $0.frame }.nonEmptySum ?? .zero
//            let group = StyledPath.Group(group.identifier, frame: frame)
//            return .branch(group, trees.map { $0.translated(by: -frame.origin) })
//        }
//    }
//
//    public var axisAlignedBoundingBox: Rectangle {
//
//        switch self {
//
//        case .leaf(let styledPath):
//            return styledPath
//                .path
//                .axisAlignedBoundingBox
//                .translated(by: -styledPath.frame.origin)
//
//        case let .branch(group, trees):
//            let bbox = trees.map { $0.axisAlignedBoundingBox }.nonEmptySum ?? .zero
//            return bbox.translated(by: -group.frame.origin)
//        }
//    }
//
//    public func translated(by point: Point) -> StyledPath.Composite {
//        switch self {
//        case let .leaf(styledPath):
//            return .leaf(styledPath.translated(by: point))
//        case let .branch(group, trees):
//            // TODO: Group.translated(by: Point)
//            let group = StyledPath.Group(group.identifier, frame: group.frame.translated(by: point))
//            return .branch(group, trees)
//        }
//    }
//}
