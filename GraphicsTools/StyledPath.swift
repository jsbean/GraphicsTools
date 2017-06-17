//
//  StyledPath.swift
//  GraphicsTools
//
//  Created by James Bean on 6/18/17.
//
//

import GeometryTools
import PathTools

public struct StyledPath {
    
    let path: Path
    let styling: Styling
    
    public init(
        path: Path = .unit,
        styling: Styling = Styling()
    )
    {
        self.path = path
        self.styling = styling
    }
}
