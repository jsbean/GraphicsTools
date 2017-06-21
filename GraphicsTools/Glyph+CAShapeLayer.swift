//
//  Glyph+CAShapeLayer.swift
//  GraphicsTools
//
//  Created by James Bean on 6/5/17.
//
//

import QuartzCore

public extension CAShapeLayer {
    
    public convenience init <G: GlyphProtocol> (_ glyph: G) {
        
        self.init(glyph.path)
        
        // frame
        frame = CGRect(glyph.frame)
        
        // fill
        fillColor = glyph.fill.color.cgColor
        fillRule = glyph.fill.rule.cgFillRule
        
        // stroke
        strokeColor = glyph.stroke.color.cgColor
        lineCap = glyph.stroke.cap.cgCap
        lineDashPattern = glyph.stroke.dashes?.pattern.map { NSNumber.init(value: $0) }
        lineJoin = glyph.stroke.join.cgJoin
        lineWidth = CGFloat(glyph.stroke.width)

        if let dashPhase = glyph.stroke.dashes?.phase {
            lineDashPhase = CGFloat(dashPhase)
        }
        
        if case .miter(let limit) = glyph.stroke.join {
            miterLimit = CGFloat(limit)
        }
    }
}

internal extension Fill.Rule {
    
    var cgFillRule: String {
        switch self {
        case .nonZero:
            return kCAFillRuleNonZero
        case .evenOdd:
            return kCAFillRuleEvenOdd
        }
    }
}

internal extension Stroke.Cap {
    
    var cgCap: String {
        switch self {
        case .butt:
            return kCALineCapButt
        case .round:
            return kCALineCapRound
        case .square:
            return kCALineCapSquare
        }
    }
}

internal extension Stroke.Join {
    
    var cgJoin: String {
        switch self {
        case .miter:
            return kCALineJoinMiter
        case .bevel:
            return kCALineJoinBevel
        case .round:
            return kCALineJoinRound
        }
    }
}
