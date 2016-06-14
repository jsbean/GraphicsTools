//
//  GraphicsContainerType.swift
//  GraphicsTools
//
//  Created by James Bean on 6/14/16.
//
//

import QuartzCore

public protocol GraphicsContainerType: Buildable, FrameMaking {
    
    var frame: CGRect { get set }
    var components: [CALayer] { get set }
    
    func createComponents()
    func commitComponents()
    func addSublayer(layer: CALayer)
}

extension GraphicsContainerType {
    
    public func build() {
        createComponents()
        commitComponents()
        frame = makeFrame()
    }
    
    public func commitComponents() {
        components.forEach { addSublayer($0) }
    }
}

