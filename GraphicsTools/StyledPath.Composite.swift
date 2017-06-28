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
        
        public let identifier: String
        
        public init(identifier: String = "root") {
            self.identifier = identifier
        }
    }
    
    public typealias Composite = Tree<Group,StyledPath>
}
