//
//  Shape.swift
//  GraphicsTools
//
//  Created by James Bean on 6/5/17.
//
//

import PathTools

/// Model of a shape.
public struct Shape {
    
    // MARK: - Nested Types
    
    /// Configuration for the fill of `Shape`.
    public struct Fill {
        
        // MARK: - Nested Types
        
        /// Winding rule of `Fill`.
        public enum Rule {
            case nonZero
            case evenOdd
        }
        
        // MARK: - Instance Properties
        
        /// Color of `Fill`.
        public let color: Color
        
        /// Winding rule of `Fill`.
        public let rule: Rule
        
        // MARK: - Initializers
        
        /// Creates a `Fill` with the given `color` and `rule`.
        public init(color: Color = .red, rule: Rule = .nonZero) {
            self.color = color
            self.rule = rule
        }
    }
    
    /// Configuration for the stroke of `Shape`.
    public struct Stroke {
        
        // MARK: - Nested Types
        
        /// Dash configuration of `Stroke`.
        public struct Dashes {
            let pattern: [Double]
            let phase: Double
        }
        
        /// Style of cap of `Stroke`.
        public enum Cap {
            case round
            case butt
            case square
        }
        
        /// Style of join of `Stroke`.
        public enum Join {
            case miter(limit: Double)
            case round
            case bevel
        }
        
        // MARK: - Instance Properties
        
        /// Width.
        public let width: Double
        
        /// Color.
        public let color: Color
        
        /// Join.
        public let join: Join

        /// Cap.
        public let cap: Cap
        
        /// Dashes.
        public let dashes: Dashes?
        
        // MARK: - Initializers
        
        /// Creates a `Stroke` with the given `width`, `color`, `join`, `cap`, and `dashes`.
        public init(
            width: Double = 1,
            color: Color = .red,
            join: Join = .miter(limit: 10),
            cap: Cap = .butt,
            dashes: Dashes? = nil
        )
        {
            self.width = width
            self.color = color
            self.join = join
            self.cap = cap
            self.dashes = dashes
        }
    }
    
    // MARK: - Instance Properties
    
    /// Path of `Shape`.
    public let path: Path
    
    /// Configuration for the fill of `Shape`.
    public let fill: Fill
    
    /// Configuration for the stroke of `Shape`.
    public let stroke: Stroke
    
    // MARK: - Initializers
    
    /// Creates a `Shape` with the given `path`, `fill` and `stroke` values.
    public init(path: Path, fill: Fill = Fill(), stroke: Stroke = Stroke()) {
        self.path = path
        self.fill = fill
        self.stroke = stroke
    }
}
