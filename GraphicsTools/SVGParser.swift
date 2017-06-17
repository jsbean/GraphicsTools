//
//  SVGParser.swift
//  GraphicsTools
//
//  Created by James Bean on 6/16/17.
//
//

import Collections
import GeometryTools
import PathTools
import SWXMLHash

// TODO: Make SVGFile (sim. to AKAudioFile)
public struct SVGFile {
    
    // TODO: Add location (.resources, .temp, .documents, .custom)
    public init(name: String) throws {
        fatalError()
    }
}

public final class SVGParser {

    public enum Error: Swift.Error {
        case fileNotFound(String)
        case illFormedRect(String)
    }
    
    // Determine the best type to use here.
    let svg: XMLIndexer
    
    // TODO
    public init(file: SVGFile) throws {
        fatalError()
    }

    // FIXME: Update to `URL`
    public init(name: String) throws {
        
        let bundle = Bundle(for: SVGParser.self)
        
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
        
        let styledPath = StyledPath()
        
        for indexer in svg.children {
            
            // look for group
            guard let element = indexer.element else {
                print("no element found")
                continue
            }
            
            // If group: traverse
            // Otherwise:
            // - Get styling
            // - If path: do the path thing
            // - If shape: do the shape thing
        }
        
        return .leaf(styledPath)
        
//        
//        var result: [(Path, Styling)] = []
//        for indexer in svg.children {
//            
//            guard let element = indexer.element else {
//                continue
//            }
//            
//            // Geometry
//            guard let path = Path(svgElement: element) else {
//                continue
//            }
//            
//            // Set default styling
//            guard let styling = Styling(svgElement: element) else {
//                continue
//            }
//            
//            print("styling: \(styling)")
//            
//            result.append((path, styling))
//
//        }
//        
//        return result
    }
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

extension PathElement {
    
    public init?(svgCommand: String, svgValues: String, previous: PathElement?) {
        
        let numbers = values(from: svgValues)

        switch svgCommand {
        
        // absolute move to
        case "M":
            self = .move(Point(x: numbers[0], y: numbers[1]))
            
        // relative move to
        case "m":
            guard let ref = previous?.point else { return nil }
            self = .move(Point(x: numbers[0], y: numbers[1]) + ref)

        // absolute line to
        case "L":
            self = .line(Point(x: numbers[0], y: numbers[1]))
            
        // relative line to
        case "l":
            guard let ref = previous?.point else { return nil }
            self = .line(Point(x: numbers[0], y: numbers[1]) + ref)
            
        // absolute line vertical
        case "V":
            guard let ref = previous?.point else { return nil }
            self = .line(Point(x: ref.x, y: numbers[0]))
            
        // relative line vertical
        case "v":
            guard let ref = previous?.point else { return nil }
            self = .line(Point(x: ref.x, y: numbers[0] + ref.y))
            
        // absolute line horizontal
        case "H":
            guard let ref = previous?.point else { return nil }
            self = .line(Point(x: numbers[0], y: ref.y))
            
        case "h": // relative line horizontal
            guard let ref = previous?.point else { return nil }
            self = .line(Point(x: numbers[0] + ref.x, y: ref.y))
            
        // absolute quad broken
        case "Q":
            // x1 y1 x y
            let control = Point(x: numbers[0], y: numbers[1])
            let destination = Point(x: numbers[2], y: numbers[3])
            self = .quadCurve(destination, control)
            
        // relative quad broken
        case "q":
            // x1 y1 x y
            guard let ref = previous?.point else { return nil }
            let control = Point(x: numbers[0], y: numbers[1]) + ref
            let destination = Point(x: numbers[2], y: numbers[3]) + ref
            self = .quadCurve(destination, control)
            
        // absolute quad smooth
        case "T":
            return nil
            
        // relative quad smooth
        case "t":
            return nil

        // absolute cubic broken
        case "C":
            // x1 y1 x2 y2 x y
            let control1 = Point(x: numbers[0], y: numbers[1])
            let control2 = Point(x: numbers[2], y: numbers[3])
            let destination = Point(x: numbers[4], y: numbers[5])
            self = .curve(destination, control1, control2)
            
        // relative cubic broken
        case "c":
            // x1 y1 x2 y2 x y
            guard let ref = previous?.point else { return nil }
            let control1 = Point(x: numbers[0], y: numbers[1]) + ref
            let control2 = Point(x: numbers[2], y: numbers[3]) + ref
            let destination = Point(x: numbers[4], y: numbers[5]) + ref
            self = .curve(destination, control1, control2)
            return nil
            
        // absolute cubic smooth
        case "S":
            return nil
            
        // relative cubic smooth
        case "s":
            return nil
            
        // absolute close
        case "Z", "z":
            self = .close
            
        default:
            return nil
        }
    }
}

let numberSet = CharacterSet(charactersIn: "-.0123456789eE")
func values(from pathValues: String) -> [Double] {
    
    var result: [String] = []
    var cur = ""
    var last = ""
    
    for char in pathValues.unicodeScalars {
        let next = String(char)
        if next == "-" && last != "" && last != "E" && last != "e" {
            if cur.utf16.count > 0 {
                result.append(cur)
            }
            cur = next
        } else if numberSet.contains(UnicodeScalar(char.value)!) {
            cur += next
        } else if cur.utf16.count > 0 {
            result.append(cur)
            cur = ""
        }
        last = next
    }
    
    result.append(cur)
    
    return result.flatMap { Double($0) }
}

let svgCommands = CharacterSet(charactersIn: "MmLlVvHhQqTtCcSsZz")

// FIXME: Refactor.
func commandStrings(from pathString: String) -> [(String, String)] {
    var commands: [String] = []
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

extension Rectangle {
    
    // In the form: "x y width height"
    init?(string: String) {
        self.init(stringValues: string.components(separatedBy: " "))
    }
    
    // In the form: x,y,width,height
    init?(stringValues: [String]) {
        self.init(values: stringValues.flatMap { Double($0) })
    }

    // In the form: x,y,width,height
    init?(values: [Double]) {
        guard values.count == 4 else { return nil }
        self.init(x: values[0], y: values[1], width: values[2], height: values[3])
    }
}

extension Point {
    
    // In the form: "x,y"
    init?(string: String) {
        self.init(stringValues: string.components(separatedBy: ","))
    }
    
    init?(stringValues: [String]) {
        self.init(values: stringValues.flatMap { Double($0) })
    }
    
    init?(values: [Double]) {
        
        guard values.count == 2 else {
            return nil
        }
        
        self.init(x: values[0], y: values[1])
    }
}

func parse(viewBox: String) throws -> Rectangle {
    
    let dimensions = viewBox.components(separatedBy: " ").flatMap { Double($0) }
    
    guard dimensions.count == 4 else {
        throw SVGParser.Error.illFormedRect(viewBox)
    }
    
    return Rectangle(
        x: dimensions[0],
        y: dimensions[1],
        width: dimensions[2],
        height: dimensions[3]
    )
}

