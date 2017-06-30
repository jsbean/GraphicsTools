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

        func traverse(_ composite: StyledPath.Composite, building result: CALayer) -> CALayer {
            switch composite {
            case .leaf(let styledPath):
                let layer = CAShapeLayer(styledPath)
                return layer
            case .branch(let group, let trees):
                let layer = CALayer()
                layer.frame = CGRect(group.frame)
                trees.forEach { layer.addSublayer(traverse($0, building: layer)) }
                return layer
            }
        }
        
        var frame: Rectangle {
            switch composite {
            case .leaf(let styledPath):
                return styledPath.path.axisAlignedBoundingBox
            case .branch(let group, _):
                return group.frame
            }
        }

        self.init()
        self.frame = CGRect(origin: .zero, size: CGSize(frame.size))
        self.addSublayer(traverse(composite, building: self))
    }
}
