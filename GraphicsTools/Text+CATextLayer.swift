//
//  Text+CATextLayer.swift
//  GraphicsTools
//
//  Created by James Bean on 6/13/17.
//
//

#if os(iOS)
    import UIKit
    let scale = UIScreen.main.scale
#elseif os(OSX)
    import AppKit
    let scale = NSScreen.main()!.backingScaleFactor
#endif

extension CATextLayer {
    
    public convenience init(_ text: Text) {
        self.init()
        frame = CGRect(text.frame)
        string = text.value
        font = text.font
        fontSize = CGFloat(text.fontSize)
        print("FONT SIZE: \(fontSize)")
        foregroundColor = text.color.cgColor
        contentsScale = scale
    }
}
