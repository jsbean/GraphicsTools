//
//  PathElement+SVG.swift
//  GraphicsTools
//
//  Created by James Bean on 6/19/17.
//
//

import GeometryTools
import PathTools

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
