//
//  Renderable.swift
//  GraphicsTools
//
//  Created by James Bean on 6/27/17.
//
//

/// Type which can be configured by its own `Configuration` type.
public protocol Renderable {
    
    /// `StyledPath.Composite`-representation of `Renderable`-conforming type.
    var rendered: StyledPath.Composite { get }
}
