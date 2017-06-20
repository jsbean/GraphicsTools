//
//  Styling+SVG.swift
//  GraphicsTools
//
//  Created by James Bean on 6/19/17.
//
//

extension Styling: SVGInitializable {
    
    init(svgElement: SVGElement) throws {
        self.init(
            fill: try Fill(svgElement: svgElement),
            stroke: try Stroke(svgElement: svgElement)
        )
    }
}

extension Fill: SVGInitializable {
    
    init(svgElement: SVGElement) throws {
        
        func color(_ svgElement: SVGElement) throws -> Color {
            
            let colorString: String = svgElement.value(ofAttribute: "fill") ?? "#000000"

            let opacity: Double = svgElement.value(ofAttribute: "fill-opacity")
                ?? svgElement.value(ofAttribute: "opacity")
                ?? 1
            
            guard let color = Color(hex: colorString, alpha: opacity) else {
                throw SVG.Parser.Error.illFormedFill(svgElement)
            }
            
            return color
        }
        
        func rule(_ svgElement: SVGElement) throws -> Fill.Rule {
            
            let ruleString: String = svgElement.value(ofAttribute: "fill-rule") ?? "nonZero"
            
            guard let rule = Fill.Rule(rawValue: ruleString) else {
                throw SVG.Parser.Error.illFormedFill(svgElement)
            }
            
            return rule
        }
        
        self.init(color: try color(svgElement), rule: try rule(svgElement))
    }
}

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
        
        /// Make initializer on `Join`
        func join(_ svgElement: SVGElement) throws -> Join {
            
            let lineJoinString: String = svgElement.value(ofAttribute: "stroke-linejoin")
                ?? "miter"
            
            switch lineJoinString {
            case "round":
                return .round
            case "bevel":
                return .bevel
            case "miter":
                let limit: Double = svgElement.value(ofAttribute: "miter-limit") ?? 10
                return .miter(limit: limit)
            default:
                throw SVG.Parser.Error.illFormedFill(svgElement)
            }
        }
        
        let width: Double = svgElement.value(ofAttribute: "stroke-width") ?? 1
        
        self.init(
            width: width,
            color: try color(svgElement),
            join: try join(svgElement),
            cap: .butt,
            dashes: nil
        )
    }
}
