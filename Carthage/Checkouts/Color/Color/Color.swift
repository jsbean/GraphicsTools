//
//  Color.swift
//  Color
//
//  Created by James Bean on 6/10/16.
//
//

import QuartzCore

public struct Color {
    
    public static let red   = Color(1, 0, 0, 1)
    public static let green = Color(0, 1, 0, 1)
    public static let blue  = Color(0, 0, 1, 1)
    
    public var cgColor: CGColorRef
    
    public init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) {
        self.cgColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [red, green, blue, alpha])!
    }
    
    public init(gray: CGFloat, alpha: CGFloat) {
        self.cgColor = CGColorCreate(CGColorSpaceCreateDeviceGray(), [gray, alpha])!
    }
}
