//
//  SVGTests.swift
//  GraphicsTools
//
//  Created by James Bean on 6/16/17.
//
//

import XCTest
import GraphicsTools

class SVGTests: XCTestCase {
    
    func testParseSVG() {
        
        let testFiles = [
            "line",
            "polyline",
            "polygon",
            "square",
            "rect",
            "circle",
            "ellipse",
            "curve1",
            "curve2",
            "multiple_objects",
            "multiple_groups",
            "polybezier"
        ]
    }
    
    func testStroke() {
        do {
            let parser = try SVG.Parser(name: "stroke")
            let svg = try parser.parse()
            print(svg)
        } catch {
            print(error)
        }
    }
    
    func testPolygon() {
        do {
            let parser = try SVG.Parser(name: "polygon")
            let svg = try parser.parse()
            let layer = CALayer(svg)
            layer.renderToPDF(name: "polygon")
        } catch {
            print(error)
        }
    }
    
    func testFillStrokeOpacity() {
        do {
            let svg = try SVG(name: "fill_stroke_opacity")
            let opacity = svg.structure.leaves.first!.styling.stroke.color.components.alpha
            print("stroke opacity: \(opacity)")
            let layer = CALayer(svg)
            layer.renderToPDF(name: "fill_stroke_opacity")
        } catch {
            print(error)
        }
    }
    
    func testHex() {
        let hex = "FFFFFF"
        let int = Int(hex, radix: 16)
        print(int)
    }
    
//    func testSquare() {
//        do {
//            let parser = try SVGParser(name: "square")
//            let shapes = parser.parse()
//            let container = CALayer()
//            container.frame = CGRect(x: 0, y: 0, width: 618, height: 792)
//            let layers: [CAShapeLayer] = shapes.map { path, styling in
//                let layer = CAShapeLayer(path)
//                layer.fillColor = Color.red.cgColor
//                return layer
//            }
//            
//            layers.forEach { container.addSublayer($0) }
//            container.renderToPDF(name: "svg_square")
//        } catch {
//            
//        }
//    }
//    
//    func testParseSVGLine() {
//        do {
//            let parser = try SVGParser(name: "line")
//            let shapes = parser.parse()
//            let container = CALayer()
//            container.frame = CGRect(x: 0, y: 0, width: 618, height: 792)
//            let layers: [CAShapeLayer] = shapes.map { path, styling in
//                let layer = CAShapeLayer(path)
//                layer.strokeColor = Color.red.cgColor
//                layer.lineWidth = 1
//                return layer
//            }
//            
//            layers.forEach { container.addSublayer($0) }
//            container.renderToPDF(name: "svg_line")
//        } catch {
//            
//        }
//    }
//    
//    func testParseSVGCircle() {
//        do {
//            let parser = try SVGParser(name: "circle")
//            let shapes = parser.parse()
//            let container = CALayer()
//            container.frame = CGRect(x: 0, y: 0, width: 618, height: 792)
//            let layers: [CAShapeLayer] = shapes.map { path, styling in
//                let layer = CAShapeLayer(path)
//                layer.fillColor = Color.red.cgColor
//                return layer
//            }
//            
//            layers.forEach { container.addSublayer($0) }
//            container.renderToPDF(name: "svg_circle")
//        } catch {
//            
//        }
//    }
//    
//    func testParseSVGEllipse() {
//        do {
//            let parser = try SVGParser(name: "ellipse")
//            let shapes = parser.parse()
//            let container = CALayer()
//            container.frame = CGRect(x: 0, y: 0, width: 618, height: 792)
//            let layers: [CAShapeLayer] = shapes.map { path, styling in
//                let layer = CAShapeLayer(path)
//                layer.fillColor = Color.red.cgColor
//                return layer
//            }
//            
//            layers.forEach { container.addSublayer($0) }
//            container.renderToPDF(name: "svg_ellipse")
//        } catch {
//            
//        }
//    }
//    
//    func testParseSVGPolyLine() {
//        do {
//            let parser = try SVGParser(name: "polyline")
//            let shapes = parser.parse()
//            let container = CALayer()
//            container.frame = CGRect(x: 0, y: 0, width: 618, height: 792)
//            let layers: [CAShapeLayer] = shapes.map { path, styling in
//                let layer = CAShapeLayer(path)
//                layer.strokeColor = Color.blue.cgColor
//                layer.fillColor = nil
//                return layer
//            }
//            
//            layers.forEach { container.addSublayer($0) }
//            container.renderToPDF(name: "svg_polyline")
//        } catch {
//            
//        }
//    }
//    
//    func testParseSVGPolyBezier() {
//        do {
//            let parser = try SVGParser(name: "polybezier")
//            let shapes = parser.parse()
//            let container = CALayer()
//            container.frame = CGRect(x: 0, y: 0, width: 618, height: 792)
//            let layers: [CAShapeLayer] = shapes.map { path, styling in
//                let layer = CAShapeLayer(path)
//                layer.strokeColor = Color.blue.cgColor
//                layer.fillColor = nil
//                return layer
//            }
//            
//            layers.forEach { container.addSublayer($0) }
//            container.renderToPDF(name: "svg_polybezier")
//        } catch {
//            
//        }
//    }
    
//    func testParseSVGAllTestFiles() {
//        
//        let testFiles = [
//            "line",
//            "polyline",
//            "square",
//            "rect",
//            "circle",
//            "ellipse",
//            "curve1",
//            "curve2",
//            "multiple_objects",
//            "multiple_groups",
//            "polybezier"
//        ]
//        
//        for name in testFiles {
//            do {
//                let parser = try SVGParser(name: name)
//                try parser.parse()
//                //            let shapes = parser.parse()
//                //            let container = CALayer()
//                //            container.frame = CGRect(x: 0, y: 0, width: 618, height: 792)
//                //            let layers: [CAShapeLayer] = shapes.map { path, styling in
//                //                let layer = CAShapeLayer(path)
//                //                layer.strokeColor = Color.blue.cgColor
//                //                layer.fillColor = nil
//                //                return layer
//                //            }
//                //
//                //            layers.forEach { container.addSublayer($0) }
//                //            container.renderToPDF(name: "svg_multiple_groups")
//            } catch {
//                
//            }
//        }
//    }
//    
    
    func testParseSVGPolybezier() {
        do {
            let svg = try SVG(name: "polybezier")
            let layer = CALayer(svg)
            layer.renderToPDF(name: "polybezier")
        } catch {
            
        }
    }
    
    func testParseSVGMultipleGroups() {
        do {
            let svg = try SVG(name: "multiple_groups")
            let layer = CALayer(svg)
            layer.renderToPDF(name: "multiple_groups")
        } catch {
            
        }
    }
    
    func testParseSVGColorsOpacityOrdering() {
        do {
            let svg = try SVG(name: "colors_opacity")
            let layer = CALayer(svg)
            layer.renderToPDF(name: "colors_opacity")
        } catch {
            
        }
    }
    
    func testMeasureSVGMultipleGroups() {
        measure {
            let svg = try! SVG(name: "multiple_groups")
            //let layer = CALayer(svg)
        }
    }
}
