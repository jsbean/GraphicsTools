//
//  PDFTests.swift
//  GraphicsTools
//
//  Created by James Bean on 6/2/17.
//
//

import GeometryTools
import PathTools
import XCTest

class PDFTests: XCTestCase {
    
//    func testRectsRenderedToPDF() {
//        
//        let viewLayer = CALayer()
//        viewLayer.frame = CGRect(x: 0, y: 0, width: 800, height: 600)
//        
//        let container = CALayer()
//        container.frame = viewLayer.frame.insetBy(dx: 100, dy: 100)
//        container.borderWidth = 1
//        container.borderColor = UIColor.blue.cgColor
//        container.backgroundColor = UIColor.red.cgColor
//        
//        let width = 1/3 * container.frame.width
//        let height = 1/2 * container.frame.height
//        
//        let topLeft = CALayer()
//        topLeft.frame = CGRect(x: 0, y: 0, width: width, height: height)
//        // no border width
//        // no border color
//        // no background color
//        
//        let topLeftShape = CAShapeLayer()
//        
//        let topLeftPath = Path.rectangle(x: 0, y: 0, width: 30, height: 30)
//        topLeftShape.path = topLeftPath.cgPath
//        topLeftShape.fillColor = UIColor.gray.cgColor
//        topLeftShape.lineWidth = 3
//        topLeftShape.strokeColor = UIColor.black.cgColor
//        topLeft.addSublayer(topLeftShape)
//        
//        let topCenter = CALayer()
//        topCenter.frame = CGRect(x: width, y: 0, width: width, height: height)
//        topCenter.borderWidth = 1
//        // no border color
//        // no background color
//        
//        let topCenterText = CATextLayer()
//        topCenterText.string = "TEST 1,2,3"
//        topCenterText.font = UIFont(name: "Helvetica", size: 24)
//        topCenterText.frame = topCenter.bounds
//        topCenterText.allowsFontSubpixelQuantization = true
//        topCenterText.contentsScale = UIScreen.main.scale
//        topCenter.addSublayer(topCenterText)
//        
//        let topRight = CALayer()
//        topRight.frame = CGRect(x: 2 * width, y: 0, width: width, height: height)
//        topRight.borderWidth = 1
//        topRight.borderColor = UIColor.green.cgColor
//        
//        let bottomLeft = CALayer()
//        bottomLeft.frame = CGRect(x: 0, y: height, width: width, height: height)
//        bottomLeft.borderWidth = 1
//        bottomLeft.borderColor = UIColor.purple.cgColor
//        bottomLeft.backgroundColor = UIColor.lightGray.cgColor
//        
//        let bottomCenter = CALayer()
//        bottomCenter.frame = CGRect(x: width, y: height, width: width, height: height)
//        // no border width
//        bottomCenter.borderColor = UIColor.cyan.cgColor
//        bottomCenter.backgroundColor = UIColor.white.cgColor
//        
//        let bottomRight = CALayer()
//        bottomRight.frame = CGRect(x: 2 * width, y: height, width: width, height: height)
//        bottomRight.borderWidth = 1
//        bottomRight.borderColor = UIColor.gray.cgColor
//        // opacity!
//        bottomRight.backgroundColor = UIColor(white: 1, alpha: 0.5).cgColor
//        
//        // add all the layers
//        [topLeft, topCenter, topRight, bottomLeft, bottomCenter, bottomRight].forEach {
//            container.addSublayer($0)
//        }
//        
//        viewLayer.addSublayer(container)
//        viewLayer.showTestBorder()
//        viewLayer.renderToPDF(name: "testLayer")
//    }
//    
//    func testCollision() {
//        
//        let a = Rectangle(x: 0, y: 0, width: 100, height: 100)
//        
//        let pathA = Path.rectangle(a)
//        let shapeA = CAShapeLayer()
//        shapeA.path = pathA.cgPath
//        shapeA.borderWidth = 1
//        shapeA.fillColor = UIColor.clear.cgColor
//        
//        let b = Rectangle(x: 50, y: 50, width: 100, height: 100)
//        let pathB = Path.rectangle(b)
//        let shapeB = CAShapeLayer()
//        shapeB.path = pathB.cgPath
//        shapeB.borderWidth = 1
//        shapeB.fillColor = UIColor.clear.cgColor
//        
//        if collision(a,b) {
//            shapeA.strokeColor = UIColor.red.cgColor
//            shapeB.strokeColor = UIColor.red.cgColor
//        } else {
//            shapeA.strokeColor = UIColor.black.cgColor
//            shapeB.strokeColor = UIColor.black.cgColor
//        }
//        
//        let container = CALayer()
//        container.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
//        container.addSublayer(shapeA)
//        container.addSublayer(shapeB)
//        container.renderToPDF(name: "intersecting_squares")
//    }
//    
//    func testBezier() {
//        
//        let curve = CubicBezierCurve(
//            start: Point(x: 0, y: 0),
//            control1: Point(x: 100, y: 0),
//            control2: Point(x: 100, y: 0),
//            end: Point(x: 100, y: 100)
//        )
//        
//        // TODO: Make addCurve(_ bezierCurve: CubicBezierCurve), etc
//        let path = Path.builder
//            .move(to: Point())
//            .addCurve(
//                to: Point(x: 100, y: 100),
//                control1: Point(x: 100, y: 0),
//                control2: Point(x: 100, y: 0)
//            )
//            .build()
//        
//        let glyph = CAShapeLayer(path)
//        glyph.strokeColor = UIColor.red.cgColor
//        glyph.lineWidth = 1
//        glyph.fillColor = nil
//        
//        let container = CALayer()
//        container.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        container.addSublayer(glyph)
//        
//        stride(from: 0, to: 1, by: 0.1).forEach { t in
//            let point = curve[t]
//            let circlePath = Path.circle(center: point, radius: 2)
//            let circleGlyph = CAShapeLayer(circlePath)
//            circleGlyph.fillColor = UIColor.lightGray.cgColor
//            container.addSublayer(circleGlyph)
//        }
//        
//        container.renderToPDF(name: "bezier")
//    }
}
