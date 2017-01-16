//
//  Color.swift
//  GraphicsTools
//
//  Created by James Bean on 1/16/17.
//
//

/// FIXME: Structure representing a color.
public struct Color {
    
    public static let red = Color(red: 1, green: 0, blue: 0, alpha: 1)
    public static let green = Color(red: 0, green: 1, blue: 0, alpha: 1)
    public static let blue = Color(red: 0, green: 0, blue: 1, alpha: 1)

    internal let redComponent: Double
    internal let greenComponent: Double
    internal let blueComponent: Double
    internal let alphaComponent: Double

    public init(red: Double, green: Double, blue: Double, alpha: Double = 1) {
        self.redComponent = red
        self.greenComponent = green
        self.blueComponent = blue
        self.alphaComponent = alpha
    }
    
    public init(gray: Double, alpha: Double) {
        self.redComponent = gray
        self.greenComponent = gray
        self.blueComponent = gray
        self.alphaComponent = alpha
    }
}
