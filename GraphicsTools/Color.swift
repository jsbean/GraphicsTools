//
//  Color.swift
//  GraphicsTools
//
//  Created by James Bean on 1/16/17.
//
//

import Collections

/// Structure representing a color.
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
    
    public init(red: Int, green: Int, blue: Int, alpha: Double = 1) {
        self.init(
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            alpha: alpha
        )
    }
    
    public init(hex: Int, alpha: Double) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: (hex) & 0xFF,
            alpha: alpha
        )
    }
    
    public init?(hex: String, alpha: Double) {

        let hexString = hex.droppingHash
        
        guard
            hexString.characters.count == 6,
            let hex = Int(hex, radix: 16)
        else {
            return nil
        }
        
        self.init(hex: hex, alpha: alpha)
    }
}

extension String {
    
    var droppingHash: String {

        guard characters.first != "#" else {
            return self
        }
        
        return String(characters.dropFirst())
    }
}

extension Color: Equatable {
    
    public static func == (lhs: Color, rhs: Color) -> Bool {
        return (
            lhs.redComponent == rhs.redComponent &&
            lhs.greenComponent == rhs.greenComponent &&
            lhs.blueComponent == rhs.blueComponent &&
            lhs.alphaComponent == rhs.alphaComponent
        )
    }
}
