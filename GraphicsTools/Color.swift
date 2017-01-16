//
//  Color.swift
//  GraphicsTools
//
//  Created by James Bean on 1/16/17.
//
//

public struct Color {
    
    public struct Gray {
        public subscript (value: Double) -> Color {
            return Color(gray: value, alpha: 1)
        }
    }
    
    public static var gray = Gray()

    internal let red: Double
    internal let green: Double
    internal let blue: Double
    internal let alpha: Double

    public init(red: Double, green: Double, blue: Double, alpha: Double = 1) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    public init(gray: Double, alpha: Double) {
        self.red = gray
        self.green = gray
        self.blue = gray
        self.alpha = alpha
    }
}
