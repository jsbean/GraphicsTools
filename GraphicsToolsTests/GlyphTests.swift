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

class GlyphTests: XCTestCase {
    
    
    
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
        shape.fillColor = Color.green.cgColor
        shape.strokeColor = Color.red.cgColor
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
}
