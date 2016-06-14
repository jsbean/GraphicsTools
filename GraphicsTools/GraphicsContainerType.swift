//
//  GraphicsContainerType.swift
//  GraphicsTools
//
//  Created by James Bean on 6/14/16.
//
//

import QuartzCore

/**
 For graphical objects that are composites of others.
 
 > These are assumed to be a `CALayer` or `CAShapeLayer`.
 */
public protocol GraphicsContainerType: Buildable, FrameMaking {
    
    // MARK: - Instance Properties
    
    /// Frame of object.
    var frame: CGRect { get set }
    
    /// Components that need to built and commited
    var components: [CALayer] { get set }
    
    // MARK: - Instance Methods
    
    /**
     Create the components contained herein.
     */
    func createComponents()
    
    /**
     Commit the components as sublayers.
     */
    func commitComponents()
    
    /**
     Add a CALAyer sublayer.
     
     > Shadowing the CALayer addSublayer(_:) method.
     */
    func addSublayer(layer: CALayer)
}

extension GraphicsContainerType {
    
    /**
     Perform the build phase.
     */
    public func build() {
        createComponents()
        commitComponents()
        frame = makeFrame()
    }
    
    /**
     Commit the components as sublayers.
     */
    public func commitComponents() {
        components.forEach { addSublayer($0) }
    }
}

