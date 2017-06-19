//
//  SVG.Parser.swift
//  GraphicsTools
//
//  Created by James Bean on 6/16/17.
//
//

import Collections
import GeometryTools
import PathTools
import SWXMLHash

public typealias SVGElement = SWXMLHash.XMLElement

extension SVG {
    
    public final class Parser {
        
        public enum Error: Swift.Error {
            case illFormedIndexer(XMLIndexer)
            case fileNotFound(String)
            case illFormedLine(SVGElement)
            case illFormedPolyline(SVGElement)
            case illFormedRectangle(SVGElement)
            case illFormedCircle(SVGElement)
            case illFormedEllipse(SVGElement)
            case illFormedElement(SVGElement)
            case illFormedPath(SVGElement)
            case illFormedPolygon(SVGElement)
            case illFormedStyling(SVGElement)
            case illFormedStyledPath(SVGElement)
            case illFormedFill(SVGElement)
            case illFormedStroke(SVGElement)
        }
        
        // FIXME: Determine the best type to use here.
        let svg: XMLIndexer
        
        // FIXME: Update to `URL`
        public init(name: String) throws {
            
            let bundle = Bundle(for: Parser.self)
            
            guard
                let url = bundle.url(forResource: name, withExtension: "svg")
            else {
                throw Error.fileNotFound(name)
            }
            
            let data = try Data(contentsOf: url)
            let svg = SWXMLHash.parse(data)
            self.svg = svg["svg"]
        }
        
        public func parse() throws -> SVG {
            
            func traverse(_ svgData: XMLIndexer) throws -> SVG.Structure? {
                
                guard let element = svgData.element else {
                    throw Parser.Error.illFormedIndexer(svgData)
                }
                
                switch element.name {
                    
                case "svg":
                    let group = Group(identifier: "root")
                    return .branch(group, try svgData.children.flatMap(traverse))
                    
                case "g":
                    // TODO: get group identifier from group
                    let group = Group(identifier: "group")
                    return .branch(group, try svgData.children.flatMap(traverse))
                    
                case _ where shapesByName.keys.contains(element.name), "path":
                    return .leaf(try StyledPath(svgElement: element))
                
                default:
                    print("Unsupported SVG element: \(element.name)")
                    return nil
                }
            }
            
            guard let elements = try traverse(svg) else {
                throw Error.illFormedIndexer(svg)
            }
            
            let viewBox = try svgInformation(from: svg.element!)
            
            return SVG(viewBox: viewBox, structure: elements)
        }
        
        func svgInformation(from svgElement: XMLElement) throws -> Rectangle {
            
            guard svgElement.name == "svg" else {
                throw Error.illFormedElement(svgElement)
            }
            
            if let viewBoxString: String = svgElement.value(ofAttribute: "viewBox") {
                return try Rectangle(string: viewBoxString)
            }
            
            guard
                let width: Double = svgElement.value(ofAttribute: "width"),
                let height: Double = svgElement.value(ofAttribute: "height")
            else {
                throw Error.illFormedElement(svgElement)
            }
            
            return Rectangle(origin: Point(), size: Size(width: width, height: height))
        }
    }
}

func parse(viewBox: String) throws -> Rectangle {
    
    let dimensions = viewBox.components(separatedBy: " ").flatMap { Double($0) }
    
    guard dimensions.count == 4 else {
        throw Rectangle.SVGError.illFormed(dimensions)
    }
    
    return Rectangle(
        x: dimensions[0],
        y: dimensions[1],
        width: dimensions[2],
        height: dimensions[3]
    )
}
