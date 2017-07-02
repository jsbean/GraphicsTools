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

    func testAxisAlignedBoundingBox() {

        let a = Path.circle(center: Point(), radius: 10)
        let composite = StyledPath.Composite.leaf(StyledPath(path: a))
        let bbox = composite.axisAlignedBoundingBox
        let expected = Rectangle(x: -10, y: -10, width: 20, height: 20)
        XCTAssertEqual(bbox, expected)
    }
}
