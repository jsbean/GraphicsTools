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
import QuartzCore
#endif

extension CALayer {
    
    public func renderToPDF(name: String) {

        let margin: CGFloat = 20
        
        #if os(iOS)
            
            let path = "/Users/BEAN/\(name).pdf"
            
            let pageFrame = CGRect(
                x: 0,
                y: 0,
                width: bounds.width + 2 * margin,
                height: bounds.height + 2 * margin
            )
            
            UIGraphicsBeginPDFContextToFile(path, pageFrame, nil)
            UIGraphicsBeginPDFPage()
            let context = UIGraphicsGetCurrentContext()!
            context.translateBy(x: margin, y: margin)
            render(in: context)
            UIGraphicsEndPDFContext()
        
        #elseif os(OSX)
            
            print("osx")
        
        #endif
    }
}
