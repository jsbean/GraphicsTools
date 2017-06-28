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

    public struct Components {
        public let red: Double
        public let green: Double
        public let blue: Double
        public let alpha: Double
    }
    
    public let components: Components

    public init(red: Double, green: Double, blue: Double, alpha: Double = 1) {
        self.components = Components(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public init(white: Double, alpha: Double = 1) {
        self.init(red: white, green: white, blue: white, alpha: alpha)
    }
    
    public init(gray: Double, alpha: Double) {
        print("init(gray:alpha:) is deprecated in 0.7. Use init(white:alpha:) instead.")
        self.init(red: gray, green: gray, blue: gray, alpha: alpha)
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
        
        guard let hex = Int(hexString, radix: 16) else {
            return nil
        }
        
        self.init(hex: hex, alpha: alpha)
    }
}

extension String {
    
    var droppingHash: String {

        guard characters.first == "#" else {
            return self
        }
        
        return String(characters.dropFirst())
    }
}

extension Color: Equatable {
    public static func == (lhs: Color, rhs: Color) -> Bool {
        return lhs.components == rhs.components
    }
}

extension Color.Components: Equatable {
    
    public static func == (lhs: Color.Components, rhs: Color.Components) -> Bool {
        return (
            lhs.red == rhs.red &&
            lhs.green == rhs.green &&
            lhs.blue == rhs.blue &&
            lhs.alpha == rhs.alpha
        )
    }
}
