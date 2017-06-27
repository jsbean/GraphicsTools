//
//  ConfiguredRenderable.swift
//  GraphicsTools
//
//  Created by James Bean on 6/27/17.
//
//

/// Type which can be converted into a `StyledPath.Composite`.
public protocol ConfiguredRenderable {
    
    /// Converts type into `StyledPath`.
    func render() -> StyledPath.Composite
}
