//
//  Path+SVG.swift
//  GraphicsTools
//
//  Created by James Bean on 6/19/17.
//
//

import Foundation
import Collections
import GeometryTools
import PathTools

extension Path: SVGInitializable {
    
    init(svgElement: SVGElement) throws {
        
        switch svgElement.name {
            
        // Parse path data for lines, quad curves, and cubic curves.
        case "path":
            self = try polybezier(svgElement: svgElement)
            
        // Parse default shape types
        case SVG.shapesByName.keys:
            self = try shape(svgElement: svgElement)
            
        // Non-path data!
        default:
            throw SVG.Parser.Error.illFormedPath(svgElement)
        }
    }
}

func shape(svgElement: SVGElement) throws -> Path {
    
    guard
        let path = try SVG.shapesByName[svgElement.name]?.init(svgElement: svgElement).path
    else {
        throw SVG.Parser.Error.illFormedPath(svgElement)
    }
    
    return path
}

func polybezier(svgElement: SVGElement) throws -> Path {
    
    guard let pathData: String = svgElement.value(ofAttribute: "d") else {
        throw SVG.Parser.Error.illFormedPath(svgElement)
    }
    
    let commands = commandStrings(from: pathData)
    
    let pathElements: [PathElement] = commands.reduce([]) { accum, cur in
        
        let (command, values) = cur
        let prev = accum.last
        
        let pathElement = PathElement(
            svgCommand: command,
            svgValues: values,
            previous: prev
        )
        
        return accum + pathElement
    }
    
    return Path(pathElements: pathElements)
}

extension Path {
    
    init?(svgCommands: [(String, String)]) {
        
        let elements: [PathElement] = svgCommands.reduce([]) { accum, cur in
            
            let (command, values) = cur
            
            let element = PathElement(
                svgCommand: command,
                svgValues: values,
                previous: accum.last
            )
            
            return accum + element
        }
        
        self.init(pathElements: elements)
    }
}

let svgCommands = CharacterSet(charactersIn: "MmLlVvHhQqTtCcSsZz")

func commandStrings(from pathString: String) -> [(String, String)] {
    
    var commands: [String] = []
    
    // FIXME: Refactor
    let split = pathString.unicodeScalars.split { char in
        if svgCommands.contains(char) {
            commands.append(String(char))
            return true
        }
        return false
    }
    let values = split.map(String.init).filter { $0 != "" }
    return zip(commands, values).map { $0 }
}
