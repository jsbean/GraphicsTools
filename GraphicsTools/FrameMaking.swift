//
//  FrameMaking.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore

public protocol FrameMaking {
    
    var frame: CGRect { get set }
    
    func makeFrame() -> CGRect
}