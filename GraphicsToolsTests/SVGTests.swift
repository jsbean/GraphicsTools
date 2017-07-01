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
            "polybezier",
            "bbox"
        ]
        
        for name in testFiles {
            do {
                let svg = try SVG(name: name)
                let path = StyledPath.Composite(svg)
                let layer = CALayer(path)
                layer.renderToPDF(name: name)
            } catch {
                print(error)
            }
        }
    }

    func testScaleSVG() {

        do {
            let svg = try SVG(name: "bbox")
            let path = StyledPath.Composite(svg, height: 1000)
            let layer = CALayer(path)
            layer.renderToPDF(name: "bbox_scale_to_height")
        } catch {
            print(error)
        }
    }
}
