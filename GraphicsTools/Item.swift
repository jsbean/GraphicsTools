//
//  Item.swift
//  GraphicsTools
//
//  Created by James Bean on 7/25/17.
//
//

import GeometryTools

public enum Item {

    public var frame: Rectangle {
        switch self {
        case .path(let path):
            return path.frame
        case .text(let text):
            return text.frame
        }
    }

    case path(StyledPath)
    case text(Text)
}
