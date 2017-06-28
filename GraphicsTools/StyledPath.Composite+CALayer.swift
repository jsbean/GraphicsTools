//
//  StyledPath.Composite+CALayer.swift
//  GraphicsTools
//
//  Created by James Bean on 6/19/17.
//
//

import QuartzCore

extension CALayer {
    
    public convenience init(_ composite: StyledPath.Composite) {

        func traverse(_ composite: StyledPath.Composite) {
            switch composite {
            case .leaf(let styledPath):
                let layer = CAShapeLayer(styledPath)
                addSublayer(layer)
            case .branch(_, let trees):
                // do something with group
                trees.forEach(traverse)
            }
        }
        
        self.init()
        traverse(composite)
    }
}
