//
//  StyledPath.Composite+CALayer.swift
//  GraphicsTools
//
//  Created by James Bean on 6/19/17.
//
//

import QuartzCore
import GeometryTools

extension CALayer {
    
    public convenience init(_ composite: StyledPath.Composite) {

        func traverse(_ composite: StyledPath.Composite) -> CALayer {
            switch composite {
            case .leaf(let styledPath):
                let layer = CAShapeLayer(styledPath)
                return layer
            case .branch(let group, let trees):
                let layer = CALayer()
                layer.frame = CGRect(group.frame)
                trees.forEach { layer.addSublayer(traverse($0)) }
                return layer
            }
        }

        self.init()
        self.frame = CGRect(composite.frame)
        self.addSublayer(traverse(composite))
    }
}
