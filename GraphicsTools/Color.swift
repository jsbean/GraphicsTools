//
//  Color.swift
//  GraphicsTools
//
//  Created by James Bean on 1/16/17.
//
//

import QuartzCore

/// TODO: Save internal representation that can produce a `CGColor` when asked (computed
/// property), not one that _is_ a `CGColor`.
public struct Color {
    
    public static let red   = Color(1, 0, 0, 1)
    public static let green = Color(0, 1, 0, 1)
    public static let blue  = Color(0, 0, 1, 1)
    
    // MARK: - Instance Properties
    
    public var cgColor: CGColor
    
    // MARK: - Initializers
    
    /// Create a `Color` with the given `red`, `green`, `blue`, and `alpha` values.
    /// 
    /// > These values shall all be in the range of `0...1`.
    public init(_ red: Double, _ green: Double, _ blue: Double, _ alpha: Double) {
        
        self.cgColor = CGColor(
            colorSpace: CGColorSpaceCreateDeviceRGB(),
            components: [
                CGFloat(red),
                CGFloat(green),
                CGFloat(blue),
                CGFloat(alpha)
            ]
        )!
    }
    
    /// Create a grayscale `Color` with the given `gray` and `alpha` values.
    ///
    /// > These values shall be in the range of `0...1`.
    /// > A `gray` value of `1` is black, while a `gray` value of `0` is white.
    public init(gray: Double, alpha: Double) {
        
        self.cgColor = CGColor(
            colorSpace: CGColorSpaceCreateDeviceGray(),
            components: [
                CGFloat(gray),
                CGFloat(alpha)
            ]
        )!
    }
}
