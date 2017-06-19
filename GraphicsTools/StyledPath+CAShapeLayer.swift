//
//  StyledPath+CAShapeLayer.swift
//  GraphicsTools
//
//  Created by James Bean on 6/19/17.
//
//

import QuartzCore

extension CAShapeLayer {
    
    public convenience init (_ styledPath: StyledPath) {
        
        self.init(styledPath.path)
        // frame
        frame = CGRect(styledPath.frame)
        
        let styling = styledPath.styling
        
        // fill
        fillColor = styling.fill.color.cgColor
        fillRule = styling.fill.rule.cgFillRule
        
        // stroke
        strokeColor = styling.stroke.color.cgColor
        lineCap = styling.stroke.cap.cgCap
        lineDashPattern = styling.stroke.dashes?.pattern.map { NSNumber.init(value: $0) }
        lineJoin = styling.stroke.join.cgJoin
        lineWidth = CGFloat(styling.stroke.width)
        
        if let dashPhase = styling.stroke.dashes?.phase {
            lineDashPhase = CGFloat(dashPhase)
        }
        
        if case .miter(let limit) = styling.stroke.join {
            miterLimit = CGFloat(limit)
        }
    }
}
