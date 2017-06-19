//
//  Rectangle+SVG.swift
//  GraphicsTools
//
//  Created by James Bean on 6/19/17.
//
//

import GeometryTools

extension Rectangle {
    
    /// Things that can go wrong when creating a `Rectangle` from an `SVG` element.
    public enum SVGRectangleError: Swift.Error {
        case illFormed([Double])
    }
    
    // In the form: "x y width height"
    init(string: String) throws {
        try self.init(stringValues: string.components(separatedBy: " "))
    }
    
    // In the form: x,y,width,height
    init(stringValues: [String]) throws {
        try self.init(values: stringValues.flatMap { Double($0) })
    }
    
    // In the form: x,y,width,height
    init(values: [Double]) throws {
        
        guard values.count == 4 else {
            throw SVGRectangleError.illFormed(values)
        }
        
        self.init(x: values[0], y: values[1], width: values[2], height: values[3])
    }
}
