//
//  ShapeTests.swift
//  GraphicsTools
//
//  Created by James Bean on 6/4/17.
//
//

import XCTest
import PathTools
import GraphicsTools

class ShapeTests: XCTestCase {
    
    func testSquare() {
        let square = Path.square(center: Point(x: 20, y: 20), width: 40)
        let shape = CAShapeLayer(square)
        shape.frame = CGRect(Rectangle(x: 0, y: 0, width: 40, height: 40))
        shape.fillColor = UIColor.lightGray.cgColor
        shape.strokeColor = UIColor.red.cgColor
        shape.renderToPDF(name: "square")
    }
    
    func testRectangle() {
        let rect = Rectangle(x: 0, y: 0, width: 40, height: 25)
        let square = Path.rectangle(rect)
        let shape = CAShapeLayer(square)
        shape.frame = CGRect(rect)
        shape.fillColor = UIColor.lightGray.cgColor
        shape.strokeColor = UIColor.red.cgColor
        shape.renderToPDF(name: "rectangle")
    }
    
    func testEllipse() {
        let rect = Rectangle(x: 0, y: 0, width: 40, height: 25)
        let ellipse = Path.ellipse(in: rect)
        let shape = CAShapeLayer(ellipse)
        shape.frame = CGRect(rect)
        shape.fillColor = UIColor.lightGray.cgColor
        shape.strokeColor = UIColor.red.cgColor
        shape.renderToPDF(name: "ellipse")
    }
}
