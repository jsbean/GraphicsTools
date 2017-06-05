//
//  Shape+CAShapeLayer.swift
//  GraphicsTools
//
//  Created by James Bean on 6/5/17.
//
//

import QuartzCore

public extension CAShapeLayer {
    
    public convenience init(_ shape: Shape) {
        
        self.init()
        
        // fill
        fillColor = shape.fill.color.cgColor
        fillRule = shape.fill.rule.cgFillRule
        
        // stroke
        strokeColor = shape.stroke.color.cgColor
        lineCap = shape.stroke.cap.cgCap
        lineDashPattern = shape.stroke.dashes?.pattern.map { NSNumber.init(value: $0) }
        lineJoin = shape.stroke.join.cgJoin
        lineWidth = CGFloat(shape.stroke.width)

        if let dashPhase = shape.stroke.dashes?.phase {
            lineDashPhase = CGFloat(dashPhase)
        }
        
        if case .miter(let limit) = shape.stroke.join {
            miterLimit = CGFloat(limit)
        }
    }
}

private extension Shape.Fill.Rule {
    
    var cgFillRule: String {
        switch self {
        case .nonZero:
            return kCAFillRuleNonZero
        case .evenOdd:
            return kCAFillRuleEvenOdd
        }
    }
}

private extension Shape.Stroke.Cap {
    
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

private extension Shape.Stroke.Join {
    
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
