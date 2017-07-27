//
//  GraphicsTestCase.swift
//  GraphicsTools
//
//  Created by James Bean on 6/2/17.
//
//

import GeometryTools
import PathTools
import GraphicsTools
import GraphicsTestTools
import XCTest

class PDFTests: GraphicsTestCase {

    func testPDF() {
        let path = Path.circle(center: .zero, radius: 10)
        let styling = Styling(fill: Fill(color: .chartreuse))
        let styledPath = StyledPath(path: path, styling: styling)
        render(styledPath, name: "testCircle3")
    }
}
