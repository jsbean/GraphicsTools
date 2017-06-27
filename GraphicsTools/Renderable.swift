//
//  Renderable.swift
//  GraphicsTools
//
//  Created by James Bean on 6/27/17.
//
//

/// Type which can be configured by its own `Configuration` type.
public protocol Renderable {
    
    /// Type-specific configuration.
    associatedtype Configuration
    
    /// Converts type into a `ConfiguredRenderable`, ready to be converted into a `StyledPath`.
    func render(with configuration: Configuration) -> ConfiguredRenderable
}
