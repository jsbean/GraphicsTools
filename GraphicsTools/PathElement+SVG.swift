//
//  PathElement+SVG.swift
//  GraphicsTools
//
//  Created by James Bean on 6/19/17.
//
//

import GeometryTools
import PathTools

enum Coordinate {
    case absolute
    case relative
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
            
            guard
                let previous = previous,
                let control = smoothControlPoint(for: previous)
            else {
                return nil
            }
            
            let destination = Point(x: numbers[0], y: numbers[1])
            self = .quadCurve(destination, control)
            
        // relative quad smooth
        case "t":
            
            guard
                let previous = previous,
                let ref = previous.point,
                let control = smoothControlPoint(for: previous)
            else {
                return nil
            }
            
            let destination = Point(x: numbers[0], y: numbers[1]) + ref
            self = .quadCurve(destination, control)
            
        // absolute cubic broken
        case "C":
            let control1 = Point(x: numbers[0], y: numbers[1])
            let control2 = Point(x: numbers[2], y: numbers[3])
            let destination = Point(x: numbers[4], y: numbers[5])
            self = .curve(destination, control1, control2)
            
        // relative cubic broken
        case "c":
            
            guard let ref = previous?.point else {
                return nil
            }

            let control1 = Point(x: numbers[0], y: numbers[1]) + ref
            let control2 = Point(x: numbers[2], y: numbers[3]) + ref
            let destination = Point(x: numbers[4], y: numbers[5]) + ref
            self = .curve(destination, control1, control2)
            
        // absolute cubic smooth
        case "S":
            
            // The spec says to make assumptions
            guard
                let previous = previous,
                let control1 = smoothControlPoint(for: previous)
            else {
                return nil
            }
            
            let control2 = Point(x: numbers[0], y: numbers[1])
            let destination = Point(x: numbers[2], y: numbers[3])
            self = .curve(destination, control1, control2)
            
        // relative cubic smooth
        case "s":
            
            // The spec says to make assumptions
            guard
                let previous = previous,
                let ref = previous.point,
                let control1 = smoothControlPoint(for: previous)
            else {
                return nil
            }
            
            let control2 = Point(x: numbers[0], y: numbers[1]) + ref
            let destination = Point(x: numbers[2], y: numbers[3]) + ref
            self = .curve(destination, control1, control2)
            
        // absolute close
        case "Z", "z":
            self = .close
            
        default:
            return nil
        }
    }
}

func smoothControlPoint(for pathElement: PathElement) -> Point? {
    
    func pointReflected(from control: Point, over end: Point) -> Point {
        let segment = Line.Segment(start: control, end: end)
        let ray = Line.Ray(segment)
        return ray.point(at: segment.length * 2)
    }
    
    switch pathElement {
    case let .quadCurve(end, control):
        return pointReflected(from: control, over: end)
    case let .curve(end, _, control2):
        return pointReflected(from: control2, over: end)
    default:
        return nil
    }
}
