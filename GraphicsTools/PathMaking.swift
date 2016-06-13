//
//  PathMaking.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore

public protocol PathMaking {
    
    var path: CGPath? { get set }
    
    func makePath() -> CGPath
}