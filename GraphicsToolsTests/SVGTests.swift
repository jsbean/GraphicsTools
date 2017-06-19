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
//    func testParseSVGMultipleGroups() {
//        do {
//            let parser = try SVGParser(name: "multiple_groups")
//            let svg = try parser.parse()
//            print(svg)
//        } catch {
//            
//        }
//    }
}
