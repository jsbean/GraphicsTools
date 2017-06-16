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
        do {
            let parser = try SVGParser(name: "sample")
            
        } catch {
            print(error)
        }
        
    }
}
