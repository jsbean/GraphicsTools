//
//  Stroke+SVGInitializable.swift
//  GraphicsTools
//
//  Created by James Bean on 6/20/17.
//
//

extension Stroke: SVGInitializable {
    
    init(svgElement: SVGElement) throws {
        
        /// Make initializer on `Color`
        func color(_ svgElement: SVGElement) throws -> Color {
            
            let colorString: String = svgElement.value(ofAttribute: "stroke") ?? "#000000"
            
            let opacity: Double = svgElement.value(ofAttribute: "stroke-opacity")
                ?? svgElement.value(ofAttribute: "opacity")
                ?? 1
            
            guard let color = Color(hex: colorString, alpha: opacity) else {
                throw SVG.Parser.Error.illFormedStroke(svgElement)
            }
            
            return color
        }
        
        let width: Double = svgElement.value(ofAttribute: "stroke-width") ?? 1
        
        self.init(
            width: width,
            color: try color(svgElement),
            join: try Stroke.Join(svgElement: svgElement),
            cap: .butt,
            dashes: nil
        )
    }
}

extension Stroke.Join: SVGInitializable {
    
    init(svgElement: SVGElement) throws {
        
        let lineJoinString: String = svgElement.value(ofAttribute: "stroke-linejoin")
            ?? "miter"
        
        switch lineJoinString {
        case "round":
            self = .round
        case "bevel":
            self = .bevel
        case "miter":
            let limit: Double = svgElement.value(ofAttribute: "miter-limit") ?? 10
            self = .miter(limit: limit)
        default:
            throw SVG.Parser.Error.illFormedFill(svgElement)
        }
    }
}
