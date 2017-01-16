//
//  Color+CGColor.swift
//  GraphicsTools
//
//  Created by James Bean on 1/16/17.
//
//

import QuartzCore

extension Color {
    
    public var cgColor: CGColor {
        return CGColor(
            colorSpace: CGColorSpaceCreateDeviceRGB(),
            components: [
                CGFloat(redComponent),
                CGFloat(greenComponent),
                CGFloat(blueComponent),
                CGFloat(alphaComponent)
            ]
        )!
    }
}
