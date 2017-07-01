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

// TODO: Use extension StyledPath.Composite when Swift allows it
// TODO: Refactor to keep DRY.
extension Tree where Branch == StyledPath.Group, Leaf == StyledPath {
    
    /// Creates a `StyledPath.Composite` with the given `svg`.
    public init(_ svg: SVG) {
        
        // Transform SVG structure in StyledPath.Composite
        let structure: StyledPath.Composite = .init(svg.structure)

        // TODO: Move this all to StyledPath.Composite.init
        // Normalize frame
        let boundingBox = structure.leaves.map { $0.path.axisAlignedBoundingBox }.sum
        let ref = boundingBox.origin
        let translated: StyledPath.Composite = structure.mapLeaves { styledPath in
            let path = styledPath.path.translated(by: -ref)
            return StyledPath(frame: styledPath.frame, path: path, styling: styledPath.styling)
        }
        
        // Create root group
        let frame = Rectangle(size: boundingBox.size)
        let root = StyledPath.Group("root", frame: frame)
        
        // Initialize
        self = .branch(root, [translated])
    }

    /// Creates a `StyledPath.Composite` with the given `svg`.
    public init(_ svg: SVG, height: Double) {

        // Transform SVG structure in StyledPath.Composite
        let structure: StyledPath.Composite = .init(svg.structure)

        // Normalize frame
        let boundingBox = structure.leaves.map { $0.path.axisAlignedBoundingBox }.sum
        let proportion = height / boundingBox.size.height
        let ref = boundingBox.origin
        let translated: StyledPath.Composite = structure.mapLeaves { styledPath in

            let path = styledPath.path
                .translated(by: -ref)
                .scaled(by: proportion)

            
            let fill = styledPath.styling.fill
            let stroke = styledPath.styling.stroke

            let newStroke = Stroke(
                width: stroke.width * proportion,
                color: stroke.color,
                join: stroke.join,
                cap: stroke.cap,
                dashes: stroke.dashes
            )

            let styling = Styling(fill: fill, stroke: newStroke)
            return StyledPath(frame: styledPath.frame, path: path, styling: styling)
        }

        // Create root group
        let scaledBoundingBox = boundingBox.scaled(by: proportion, around: .origin)
        let frame = Rectangle(size: scaledBoundingBox.size)
        let root = StyledPath.Group("root", frame: frame)

        // Initialize
        self = .branch(root, [translated])
    }

    public init(_ svg: SVG, width: Double) {

        // Transform SVG structure in StyledPath.Composite
        let structure: StyledPath.Composite = .init(svg.structure)

        // Normalize frame
        let boundingBox = structure.leaves.map { $0.path.axisAlignedBoundingBox }.sum
        let proportion = width / boundingBox.size.height
        let ref = boundingBox.origin
        let translated: StyledPath.Composite = structure.mapLeaves { styledPath in

            let path = styledPath.path
                .translated(by: -ref)
                .scaled(by: proportion)


            let fill = styledPath.styling.fill
            let stroke = styledPath.styling.stroke

            let newStroke = Stroke(
                width: stroke.width * proportion,
                color: stroke.color,
                join: stroke.join,
                cap: stroke.cap,
                dashes: stroke.dashes
            )

            let styling = Styling(fill: fill, stroke: newStroke)
            return StyledPath(frame: styledPath.frame, path: path, styling: styling)
        }

        // Create root group
        let scaledBoundingBox = boundingBox.scaled(by: proportion, around: .origin)
        let frame = Rectangle(size: scaledBoundingBox.size)
        let root = StyledPath.Group("root", frame: frame)

        // Initialize
        self = .branch(root, [translated])
    }

    internal init(_ svg: SVG.Structure) {
        switch svg {
        case .leaf(let styledPath):
            self = .leaf(styledPath)
        case .branch(let group, let trees):
            let group = StyledPath.Group(group)
            self = .branch(group, trees.map { .init($0) })
        }
    }
}
