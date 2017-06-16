//
//  GlyphTests.swift
//  GraphicsTools
//
//  Created by James Bean on 6/4/17.
//
//

import XCTest
import GeometryTools
import PathTools
import GraphicsTools

extension Path {
    
    init(_ line: Line) {
        self.init([BezierCurve(start: line.start, end: line.end)])
    }
}

class GlyphTests: XCTestCase {
    
    func testSquareGlyph() {
        let square = Path.rectangle(x: 0, y: 0, width: 100, height: 100)
        let glyph = Glyph(path: square)
        let layer = CAShapeLayer(glyph)
        layer.renderToPDF(name: "square_glyph")
    }
    
    func testSquarePositionedGlyph() {
        let square = Path.rectangle(x: 0, y: 0, width: 10, height: 10)
        let glyph = Glyph(path: square, position: Point(x: 30, y: 70))
        let layer = CAShapeLayer(glyph)
        layer.showTestBorder()
        //let xLine = CAShapeLayer(Glyph(path: Path(Line.vertical(at: 30))))
        //let yLine = CAShapeLayer(Glyph(path: Path(Line.horizontal(at: 70))))
        
        let xLinePath = UIBezierPath()
        xLinePath.move(to: CGPoint(x: 30, y: 0))
        xLinePath.addLine(to: CGPoint(x: 30, y: 100))
        let xLine = CAShapeLayer()
        xLine.path = xLinePath.cgPath
        xLine.lineWidth = 1
        xLine.strokeColor = UIColor.green.cgColor
        
        let yLinePath = UIBezierPath()
        yLinePath.move(to: CGPoint(x: 0, y: 70))
        yLinePath.addLine(to: CGPoint(x: 100, y: 70))
        let yLine = CAShapeLayer()
        yLine.path = yLinePath.cgPath
        yLine.lineWidth = 1
        yLine.strokeColor = UIColor.green.cgColor
        
        let container = CALayer()
        container.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        container.addSublayer(xLine)
        container.addSublayer(yLine)
        container.addSublayer(layer)
        container.renderToPDF(name: "square_positioned")
    }

    func testSquare() {
        let square = Path.square(center: Point(x: 20, y: 20), width: 40)
        let shape = CAShapeLayer(square)
        shape.frame = CGRect(Rectangle(x: 0, y: 0, width: 40, height: 40))
        shape.fillColor = Color.green.cgColor
        shape.strokeColor = Color.red.cgColor
        shape.renderToPDF(name: "square")
    }
    
    func testRectangle() {
        let rect = Rectangle(x: 0, y: 0, width: 40, height: 25)
        let square = Path.rectangle(rect)
        let shape = CAShapeLayer(square)
        shape.frame = CGRect(rect)
        shape.fillColor = Color.green.cgColor
        shape.strokeColor = Color.red.cgColor
        shape.renderToPDF(name: "rectangle")
    }
    
    func testEllipse() {
        let rect = Rectangle(x: 0, y: 0, width: 40, height: 25)
        let ellipse = Path.ellipse(in: rect)
        let shape = CAShapeLayer(ellipse)
        shape.frame = CGRect(rect)
        shape.fillColor = Color.green.cgColor
        shape.strokeColor = Color.red.cgColor
        shape.renderToPDF(name: "ellipse")
    }
    
    func testRotatedEllipse() {
        let rect = Rectangle(x: 0, y: 0, width: 40, height: 25)
        let ellipse = Path.ellipse(in: rect).rotated(by: Angle(degrees: 45))
        let shape = CAShapeLayer(ellipse)
        shape.frame = CGRect(rect)
        shape.renderToPDF(name: "rotated_ellipse")
    }
    
    func testCircle() {
        let circle = Path.circle(center: Point(x: 100, y: 100), radius: 100)
        let shape = CAShapeLayer(circle)
        shape.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        shape.fillColor = Color.green.cgColor
        shape.strokeColor = Color.red.cgColor
        shape.renderToPDF(name: "circle")
    }
    
    func testSubpaths() {
        let a = Path.parallelogram(center: Point(x: 50, y: 50 + 30), height: 30, width: 100, slope: 0.5)
        let b = Path.parallelogram(center: Point(x: 50, y: 50 - 30), height: 30, width: 100, slope: 0.5)
        let path = a + b
        let shape = CAShapeLayer(path)
        shape.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        shape.fillColor = Color.green.cgColor
        shape.strokeColor = Color.red.cgColor
        //shape.showTestBorder()
        shape.renderToPDF(name: "parallelograms")
    }
}
