//
//  PDFTests.swift
//  GraphicsTools
//
//  Created by James Bean on 6/2/17.
//
//

import GeometryTools
import PathTools
import GraphicsTools
import XCTest

class GraphicsTestCase: XCTestCase {

    lazy var artifactsDirectory: URL = {
        return Bundle(for: type(of: self)).bundleURL
            .deletingLastPathComponent()
            .appendingPathComponent("Artifacts")
    }()

    override func setUp() {
        do {
            try FileManager.default.createDirectory(
                at: artifactsDirectory,
                withIntermediateDirectories: false,
                attributes: nil
            )
        } catch {
            print(error)
        }
    }

    // TODO: Render `Composite` structures.

    // TODO: Create new directory for current target / test case
    func render(_ styledPath: StyledPath, name: String) {
        let layer = CAShapeLayer(styledPath)
        layer.renderToPDF(at: artifactsDirectory.appendingPathComponent("\(name).pdf"))
    }

    override func tearDown() {
        super.tearDown()
        let bundleURL = Bundle(for: type(of: self)).bundleURL
        print("Test artifacts produced at: \(bundleURL)")
    }
}

class PDFTests: GraphicsTestCase {

    func testPDF() {
        let path = Path.circle(center: .zero, radius: 10)
        let styling = Styling(fill: Fill(color: .chartreuse))
        let styledPath = StyledPath(path: path, styling: styling)
        render(styledPath, name: "testCircle3")
    }
}
