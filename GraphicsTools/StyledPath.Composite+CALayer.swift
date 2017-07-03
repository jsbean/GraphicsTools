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

        func traverse(_ composite: StyledPath.Composite, building container: CALayer) {
            switch composite {
            case .leaf(let styledPath):
                let layer = CAShapeLayer(styledPath)
                container.addSublayer(layer)
            case .branch(let group, let trees):
                let layer = CALayer()
                layer.frame = CGRect(group.frame)
                trees.forEach { traverse($0, building: layer) }
                container.addSublayer(layer)
            }
        }

        self.init()
        self.frame = CGRect(composite.frame)
        traverse(composite.resizedToFitContents, building: self)
    }
}
