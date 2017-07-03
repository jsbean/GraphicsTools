//
//  StyledPathTests.swift
//  GraphicsTools
//
//  Created by James Bean on 6/28/17.
//
//

import XCTest
import GeometryTools
import PathTools
import GraphicsTools

class StyledPathTests: XCTestCase {

    func testResizedToFitContents() {

        let frame = Rectangle(x: 10, y: 10, width: 100, height: 100)
        let path = Path.rectangle(x: 5, y: 5, width: 10, height: 10)
        let styledPath = StyledPath(frame: frame, path: path)
        let resized = styledPath.resizedToFitContents

        // Assert logic
        let expected = Rectangle(x: 15, y: 15, width: 10, height: 10)
        XCTAssertEqual(resized.frame, expected)

        // Check graphics
        let before = CAShapeLayer(styledPath)
        before.showTestBorder()
        before.renderToPDF(name: "testResizedToFitContentsStyledPathScaleAndTranslation_before")

        let after = CAShapeLayer(resized)
        after.showTestBorder()
        after.renderToPDF(name: "testResizedToFitContentsStyledPathScaleAndTranslation_after")
    }
}
