//
//  FrameMaking.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore

/**
 For graphical objects need to set their frame.
 */
public protocol FrameMaking {
    
    /// Frame of the object.
    var frame: CGRect { get set }
    
    /**
     Generate the frame.
     */
    func makeFrame() -> CGRect
}