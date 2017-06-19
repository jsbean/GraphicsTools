//
//  SVG.swift
//  GraphicsTools
//
//  Created by James Bean on 6/16/17.
//
//

import Foundation
import Collections
import GeometryTools
import PathTools

public struct SVG {
    
    public typealias Structure = Tree<Group,StyledPath>
    
    public enum BaseDirectory {
        case documents
        case resources
    }
    
    let viewBox: Rectangle
    
    /// Composite structure composed of `StyledPath` values.
    let structure: Structure
    
    public init(viewBox: Rectangle, structure: Structure) {
        self.viewBox = viewBox
        self.structure = structure
    }
    
//    public init(name: String, baseDirectory: BaseDirectory = .resources) throws {
//        fatalError()
//    }
}
