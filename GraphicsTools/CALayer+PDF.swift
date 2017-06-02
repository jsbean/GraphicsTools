//
//  CALayer+PDF.swift
//  GraphicsTools
//
//  Created by James Bean on 6/2/17.
//
//

#if os(iOS)
import UIKit
#elseif os(OSX)
#endif

extension CALayer {
    
    public func renderToPDF(name: String) {
        
        #if os(iOS)
        let path = "/Users/BEAN/\(name).pdf"
        UIGraphicsBeginPDFContextToFile(path, self.frame, nil)
        UIGraphicsBeginPDFPage()
        let context = UIGraphicsGetCurrentContext()!
        render(in: context)
        UIGraphicsEndPDFContext()
        
        #elseif os(OSX)
        print("osx")
        
        #endif
    }
}
