//
//  StyledPathCompositeTests.swift
//  GraphicsTools
//
//  Created by James Bean on 7/2/17.
//
//

import XCTest
import GeometryTools
import PathTools
import GraphicsTools

class StyledPathCompositeTests: XCTestCase {

    func testLeafAxisAlignedBoundingBox() {
        let path = Path.circle(center: Point(), radius: 10)
        let composite = StyledPath.Composite.leaf(StyledPath(path: path))
        let bbox = composite.axisAlignedBoundingBox
        let expected = Rectangle(x: -10, y: -10, width: 20, height: 20)
        XCTAssertEqual(bbox, expected)
    }

    func testLeafAxisAlignedBoundingBoxNonZeroFrame() {

        let path = Path.circle(center: Point(), radius: 10)

        let styledPath = StyledPath(
            frame: Rectangle(origin: Point(x: 10, y: 10)),
            path: path
        )

        let composite = StyledPath.Composite.leaf(styledPath)
        let bbox = composite.axisAlignedBoundingBox
        let expected = Rectangle(x: -20, y: -20, width: 20, height: 20)
        XCTAssertEqual(bbox, expected)
    }
}
