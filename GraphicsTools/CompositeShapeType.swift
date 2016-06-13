//
//  CompositeShapeType.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore

public protocol CompositeShapeType: Buildable, FrameMaking {

    var frame: CGRect { get set }
    var components: [CAShapeLayer] { get set }
    
    func createComponents()
    func addComponents()
    func addSublayer(layer: CALayer)
}

extension CompositeShapeType {
    
    public func build() {
        frame = makeFrame()
        createComponents()
        addComponents()
    }

    public func addComponents() {
        components.forEach { addSublayer($0) }
    }
}
