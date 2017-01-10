//
//  Renderer.swift
//  GraphicsTools
//
//  Created by James Bean on 1/10/17.
//
//

/// Renderers its information onto the given `layer` with a given `configuration`.
///
/// - note: Move this to `GraphicsTools`. Require `GraphicsTools` in `Plot`.
public protocol Renderer {
    
    /// Render contents in a given `context`, with a given `configuration`.
    func render <Context, Configuration> (
        in context: Context,
        with configuration: Configuration
    )
}
