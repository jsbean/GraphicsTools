//
//  TextBox.swift
//  GraphicsTools
//
//  Created by James Bean on 6/13/17.
//
//

import GeometryTools

public struct TextBox {
    
    let text: Text
    let borderColor: Color
    let borderWidth: Double
    let backgroundColor: Color
    let insets: Insets
    let frame: Rectangle
    
    public init(
        text: String,
        font: String,
        textColor: Color,
        borderWidth: Double,
        borderColor: Color,
        backgroundColor: Color,
        origin: Point = Point(),
        height: Double = 50,
        insets: Insets = .zero
    )
    {
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.backgroundColor = backgroundColor
        self.insets = insets
        
        self.text = Text(text,
            font: font,
            height: height - (insets.top + insets.bottom),
            color: textColor
        )

        self.frame = Rectangle(
            origin: origin,
            size: Size(
                width: self.text.width + (insets.left + insets.right),
                height: height
            )
        )
    }
}

