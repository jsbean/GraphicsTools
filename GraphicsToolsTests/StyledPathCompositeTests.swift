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

    func testBranchAllZeroFramedLeaves() {

        // bbox: (0,0),20,100
        let a = Path.rectangle(origin: Point(), size: Size(width: 100, height: 10))
        let styledA = StyledPath(path: a)

        // bbox: (-15,-15),40,40
        let b = Path.circle(center: Point(x: 5, y: 5), radius: 20)
        let styledB = StyledPath(path: b)

        let composite = StyledPath.Composite.branch(
            StyledPath.Group(), [
                .leaf(styledA),
                .leaf(styledB)
            ]
        )

        let bbox = composite.axisAlignedBoundingBox
        let expected = Rectangle(x: -15, y: -15, width: 115, height: 40)
        XCTAssertEqual(bbox, expected)
    }

    func testBranchAllZeroFramedLeavesButNonZeroGroup() {

        // bbox: (0,0),20,100
        let a = Path.rectangle(origin: Point(), size: Size(width: 100, height: 10))
        let styledA = StyledPath(path: a)

        // bbox: (-15,-15),40,40
        let b = Path.circle(center: Point(x: 5, y: 5), radius: 20)
        let styledB = StyledPath(path: b)

        let group = StyledPath.Group(frame: Rectangle(origin: Point(x: 1, y: 1)))
        let composite = StyledPath.Composite.branch(
            group, [
                .leaf(styledA),
                .leaf(styledB)
            ]
        )

        let bbox = composite.axisAlignedBoundingBox
        let expected = Rectangle(x: -16, y: -16, width: 115, height: 40)

        XCTAssertEqual(bbox, expected)
    }

    func testResizedToFitContentsLeafNoChange() {

        let rect = Rectangle(width: 10, height: 10)
        let styledPath = StyledPath(frame: rect, path: Path.rectangle(rect))
        let composite = StyledPath.Composite.leaf(styledPath)
        let resized = composite.resizedToFitContents

        // Assert logic
        XCTAssertEqual(resized.frame, rect)

        // Check graphics
        let before = CALayer(composite)
        before.showTestBorder()
        before.renderToPDF(name: "testResizedToFitContentsLeafNoChange_before")

        let after = CALayer(resized)
        after.showTestBorder()
        after.renderToPDF(name: "testResizedToFitContentsLeafNoChange_after")
    }

    func testResizedToFitContentsLeafNoTranslation() {

        let rect = Rectangle(width: 10, height: 10)
        let styledPath = StyledPath(frame: .zero, path: Path.rectangle(rect))
        let composite = StyledPath.Composite.leaf(styledPath)
        let resized = composite.resizedToFitContents

        // Assert logic
        XCTAssertEqual(resized.frame, rect)

        // Check graphics
        let before = CALayer(composite)
        before.showTestBorder()
        before.renderToPDF(name: "testResizedToFitContentsLeafNoTranslation_before")

        let after = CALayer(resized)
        after.showTestBorder()
        after.renderToPDF(name: "testResizedToFitContentsLeafNoTranslation_after")
    }

    func testResizedToFitContentsLeafScaleAndTranslation() {

        let frame = Rectangle(x: 10, y: 10, width: 100, height: 100)
        let path = Path.rectangle(x: 5, y: 5, width: 10, height: 10)
        let styledPath = StyledPath(frame: frame, path: path)
        let composite = StyledPath.Composite.leaf(styledPath)
        let resized = composite.resizedToFitContents

        // Assert logic
        let expected = Rectangle(x: 5, y: 5, width: 10, height: 10)
        XCTAssertEqual(resized.frame, expected)

        // Check graphics
        let before = CALayer(composite)
        before.showTestBorder()
        before.renderToPDF(name: "testResizedToFitContentsLeafScaleAndTranslation_before")

        let after = CALayer(resized)
        after.showTestBorder()
        after.renderToPDF(name: "testResizedToFitContentsLeafScaleAndTranslation_after")
    }

    func testResizedToFitContentsBranchScaleAndTranslation() {
        // TODO
    }
}
