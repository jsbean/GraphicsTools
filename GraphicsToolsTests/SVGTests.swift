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
    
    func testSquare() {
        do {
            let parser = try SVGParser(name: "square")
            let paths = parser.parse()
            let container = CALayer()
            container.frame = CGRect(x: 0, y: 0, width: 618, height: 792)
            let layers: [CAShapeLayer] = paths.map {
                let layer = CAShapeLayer($0)
                layer.fillColor = Color.red.cgColor
                return layer
            }
            
            layers.forEach { container.addSublayer($0) }
            container.renderToPDF(name: "svg_square")
        } catch {
            
        }
    }
    
    func testParseSVGLine() {
        do {
            let parser = try SVGParser(name: "line")
            let paths = parser.parse()
            let container = CALayer()
            container.frame = CGRect(x: 0, y: 0, width: 618, height: 792)
            let layers: [CAShapeLayer] = paths.map {
                let layer = CAShapeLayer($0)
                layer.strokeColor = Color.red.cgColor
                layer.lineWidth = 1
                return layer
            }
            
            layers.forEach { container.addSublayer($0) }
            container.renderToPDF(name: "svg_line")
        } catch {
            
        }
    }
    
    func testParseSVGCircle() {
        do {
            let parser = try SVGParser(name: "circle")
            let paths = parser.parse()
            let container = CALayer()
            container.frame = CGRect(x: 0, y: 0, width: 618, height: 792)
            let layers: [CAShapeLayer] = paths.map {
                let layer = CAShapeLayer($0)
                layer.fillColor = Color.red.cgColor
                return layer
            }
            
            layers.forEach { container.addSublayer($0) }
            container.renderToPDF(name: "svg_circle")
        } catch {
            
        }
    }
    
    func testParseSVGEllipse() {
        do {
            let parser = try SVGParser(name: "ellipse")
            let paths = parser.parse()
            let container = CALayer()
            container.frame = CGRect(x: 0, y: 0, width: 618, height: 792)
            let layers: [CAShapeLayer] = paths.map {
                let layer = CAShapeLayer($0)
                layer.fillColor = Color.red.cgColor
                return layer
            }
            
            layers.forEach { container.addSublayer($0) }
            container.renderToPDF(name: "svg_ellipse")
        } catch {
            
        }
    }
    
    func testParseSVGPolyLine() {
        do {
            let parser = try SVGParser(name: "polyline")
            let paths = parser.parse()
            let container = CALayer()
            container.frame = CGRect(x: 0, y: 0, width: 618, height: 792)
            let layers: [CAShapeLayer] = paths.map {
                let layer = CAShapeLayer($0)
                layer.strokeColor = Color.blue.cgColor
                layer.fillColor = nil
                return layer
            }
            
            layers.forEach { container.addSublayer($0) }
            container.renderToPDF(name: "svg_polyline")
        } catch {
            
        }
    }
    
    func testParseSVGPolyBezier() {
        do {
            let parser = try SVGParser(name: "polybezier")
            let paths = parser.parse()
            let container = CALayer()
            container.frame = CGRect(x: 0, y: 0, width: 618, height: 792)
            let layers: [CAShapeLayer] = paths.map {
                let layer = CAShapeLayer($0)
                layer.strokeColor = Color.blue.cgColor
                layer.fillColor = nil
                return layer
            }
            
            layers.forEach { container.addSublayer($0) }
            container.renderToPDF(name: "svg_polybezier")
        } catch {
            
        }
    }
}
