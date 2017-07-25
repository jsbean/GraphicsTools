//
//  SVG+CALayer.swift
//  GraphicsTools
//
//  Created by James Bean on 6/19/17.
//
//

import QuartzCore

extension CALayer {
    
    public convenience init(_ svg: SVG) {
        self.init(Composite(svg))
    }
}
