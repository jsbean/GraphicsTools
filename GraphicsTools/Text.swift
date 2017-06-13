//
//  Text.swift
//  GraphicsTools
//
//  Created by James Bean on 6/13/17.
//
//

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

import GeometryTools

public struct Text {

    public struct Scale {
        
        public enum Mode {
            
            // Use line height
            case all
            
            // Uses cap height to size when on vertical axis
            case numbersAndUpperCase
        }
        
        let value: Double
        let axis: Axis
        let mode: Mode
        
        public init(to value: Double, axis: Axis, for mode: Mode) {
            self.value = value
            self.axis = axis
            self.mode = mode
        }
    }
    
    public var frame: Rectangle {
        let deltaY = (ascent - capHeight)
        print("deltaY: \(deltaY)")
        //return Rectangle(x: 0, y: descent, width: 200, height: height)
        return Rectangle(x: 0, y: -deltaY, width: width, height: height)
    }
    
    // em value in points
    public var em: Double {
        switch scale.axis {
        case .vertical:
            return scale.value / Double(font.capHeight)
        case .horizontal:
            fatalError()
        }
    }
    
    public var descent: Double {
        print("descent: \(font.descent)")
        return Double(font.descent) * em
    }
    
    public var ascent: Double {
        print("ascent: \(font.ascent)")
        return Double(font.ascent) * em
    }
    
    public var capHeight: Double {
        print("cap height: \(font.capHeight)")
        return Double(font.capHeight) * em
    }
    
    public var height: Double {
        let h = Double(font.unitsPerEm) * em
        print("height: \(h)")
        return h
    }
    
    public var width: Double {
        #if os(iOS)
            let rect = value.size(
                attributes: [
                    NSFontAttributeName: UIFont(name: fontName, size: CGFloat(fontSize))!
                ]
            )
            return Double(rect.width)
        #elseif os(OSX)
            print("OSX not supported yet!")
            return 0
        #endif
    }
    
    public var fontSize: Double {
        return Double(font.unitsPerEm) * em
    }
    
    let font: CGFont
    let fontName: String
    let value: String
    let scale: Scale
    let color: Color
    
    /// - TODO: Frame
    /// - TODO: Output `CATextLayer` or sim. (but quarantine)
    public init(
        _ value: String,
        font fontName: String = "Helvetica",
        height: Double = 24,
        color: Color = .red
    )
    {
        self.fontName = fontName
        self.font = CGFont(fontName as CFString)!
        print("em: \(font.unitsPerEm)")
        self.value = value
        self.scale = Scale(to: height, axis: .vertical, for: .numbersAndUpperCase)
        self.color = color
    }
}
