//
//  Styling.swift
//  GraphicsTools
//
//  Created by James Bean on 6/18/17.
//
//

/// Composition of `Fill` and `Stroke`.
public struct Styling {
    
    let fill: Fill
    let stroke: Stroke
    
    public init(fill: Fill = Fill(), stroke: Stroke = Stroke()) {
        self.fill = fill
        self.stroke = stroke
    }
}
