//
//  TestFrame.swift
//  GraphicsTools
//
//  Created by James Bean on 6/2/17.
//
//

import QuartzCore

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

extension CALayer {

    public func showTestBorder() {
        
        borderWidth = 1
        
        #if os(iOS)
            borderColor = UIColor.red.cgColor
            backgroundColor = UIColor.red.withAlphaComponent(0.125).cgColor
        #elseif os(OSX)
            borderColor = NSColor.red.cgColor
            backgroundColor = NSColor.red.withAlphaComponent(0.125).cgColor
        #endif        
    }
}
