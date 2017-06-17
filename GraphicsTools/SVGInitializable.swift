//
//  SVGInitializable.swift
//  GraphicsTools
//
//  Created by James Bean on 6/17/17.
//
//

import Collections
import GeometryTools
import PathTools
import SWXMLHash

protocol SVGInitializable {
    init?(svgElement: XMLElement)
}



//// TODO:
//extension Path: SVGInitializable {
//    
//    init?(svgElement: XMLElement) {
//        
//        // Transforms the SVG string name to a type that can be constructed with a SVG Element
//        // and can generate a `Path`.
//        let map: [String: (SVGInitializable & PathRepresentable).Type] = [
//            "line": Line.self,
//            "polyline": Polyline.self,
//            "rect": Rectangle.self,
//            "circle": Circle.self,
//            "ellipse": Ellipse.self
//            // "polygon": Polygon.self
//        ]
//        
//        if map.keys.contains(svgElement.name) {
//            
//            guard let element = map[svgElement.name]?.init(svgElement: svgElement) else {
//                return nil
//            }
//            
//            self = element.path
//            return
//        }
//        
//        switch svgElement.name {
//            
//        case "line", "polyline", "rect", "circle", "ellipse" /*"polygon"*/:
//            
//            guard let element = map[svgElement.name]?.init(svgElement: svgElement) else {
//                return nil
//            }
//            
//            self = element.path
//            return
//            
////        case "line":
////            guard let line = Line(svgElement: svgElement) else { return nil }
////            self.init(line)
////            
////        case "polyline":
////            guard let polyline = Polyline(svgElement: svgElement) else { return nil }
////            self.init(polyline)
////            
////        case "rect":
////            guard let rect = Rectangle(svgElement: svgElement) else { return nil }
////            self.init(rect)
////            
////        case "circle":
////            guard let circle = Circle(svgElement: svgElement) else { return nil }
////            self.init(circle)
////            
////        case "ellipse":
////            guard let ellipse = Ellipse(svgElement: svgElement) else { return nil }
////            self.init(ellipse)
//            
//        case "path":
//            let pathData: String = svgElement.value(ofAttribute: "d")!
//            let commands = commandStrings(from: pathData)
//            let pathElements: [PathElement] = commands.reduce([]) { accum, cur in
//                let (command, values) = cur
//                let prev = accum.last
//                return accum + PathElement(svgCommand: command, svgValues: values, previous: prev)
//            }
//            self.init(pathElements: pathElements)
//            
//        case "polygon":
//            print("polygon")
//            return nil
//            
//        case "g":
//            print("group")
//            return nil
//            
//        default:
//            return nil
//        }
//    }
//}

extension Line: SVGInitializable {
    
    init?(svgElement: XMLElement) {
        
        guard
            let x1: Double = svgElement.value(ofAttribute: "x1"),
            let y1: Double = svgElement.value(ofAttribute: "y1"),
            let x2: Double = svgElement.value(ofAttribute: "x2"),
            let y2: Double = svgElement.value(ofAttribute: "y2")
        else {
            return nil
        }
        
        self.init(start: Point(x: x1, y: y1), end: Point(x: x2, y: y2))
    }
}

extension Polyline: SVGInitializable {
    
    init?(svgElement: XMLElement) {
        
        guard let pointsString: String = svgElement.value(ofAttribute: "points") else {
            return nil
        }
        
        let points = pointsString
            .components(separatedBy: " ").filter { $0 != "" }
            .flatMap { Point(string: $0) }
        
        self.init(points)
    }
}

extension Rectangle: SVGInitializable {
    
    init?(svgElement: XMLElement) {
        
        guard
            let x: Double = svgElement.value(ofAttribute: "x"),
            let y: Double = svgElement.value(ofAttribute: "y"),
            let width: Double = svgElement.value(ofAttribute: "width"),
            let height: Double = svgElement.value(ofAttribute: "height")
        else {
            return nil
        }
        
        self.init(origin: Point(x: x, y: y), size: Size(width: width, height: height))
    }
}

extension Circle: SVGInitializable {
    
    init?(svgElement: XMLElement) {
        
        guard
            let x: Double = svgElement.value(ofAttribute: "cx"),
            let y: Double = svgElement.value(ofAttribute: "cy"),
            let radius: Double = svgElement.value(ofAttribute: "r")
        else {
            return nil
        }
        
        self.init(center: Point(x: x, y: y), radius: radius)
    }
}

extension Ellipse: SVGInitializable {
    
    init?(svgElement: XMLElement) {
        
        guard
            let x: Double = svgElement.value(ofAttribute: "cx"),
            let y: Double = svgElement.value(ofAttribute: "cy"),
            let radiusX: Double = svgElement.value(ofAttribute: "rx"),
            let radiusY: Double = svgElement.value(ofAttribute: "ry")
        else {
            return nil
        }
        
        self.init(
            center: Point(x: x, y: y),
            size: Size(width: 2 * radiusX, height: 2 * radiusY)
        )
    }
}

extension Styling: SVGInitializable {
    
    init?(svgElement: XMLElement) {
        
        guard
            let fill = Fill(svgElement: svgElement),
            let stroke = Stroke(svgElement: svgElement)
        else {
            return nil
        }
        
        self.init(fill: Fill(), stroke: Stroke())
    }
}

extension Fill: SVGInitializable {
    
    init?(svgElement: XMLElement) {
        return nil
    }
}


extension Stroke: SVGInitializable {
    
    init?(svgElement: XMLElement) {
        return nil
    }
}
