//
//  Buildable.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import Foundation

/// For graphic objects that have a build phase.
public protocol Buildable: class {
    
    // MARK: - Instance Methods
    
    /**
     Perform the build phase.
     */
    func build()
}
