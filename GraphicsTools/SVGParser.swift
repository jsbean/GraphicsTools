//
//  SVGParser.swift
//  GraphicsTools
//
//  Created by James Bean on 6/16/17.
//
//

import SWXMLHash

public class SVGParser {
    
    public enum Error: Swift.Error {
        case fileNotFound(String)
    }
    
    // FIXME: This is currently set-up to test a single file
    // - Extend this to test arbitrary files
    public init(name: String) throws  {
        
        let bundle = Bundle(for: SVGParser.self)
        
        guard
            let url = bundle.url(forResource: name, withExtension: "svg")
        else {
            throw Error.fileNotFound(name)
        }
        
        let data = try Data(contentsOf: url)
        let svg = SWXMLHash.parse(data)

        for element in svg.all {
            print(element)
        }
    }
}
