//
//  StyledPath.Composite.swift
//  GraphicsTools
//
//  Created by James Bean on 6/27/17.
//
//

import Collections

extension StyledPath {
    
    public struct Group {
        let identifier: String
    }
    
    public typealias Composite = Tree<Group,StyledPath>
}
