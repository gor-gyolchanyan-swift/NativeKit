//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

#if os(macOS)
    import AppKit

    extension NSBezierPath {

        // MARK: NSBezierPath - CGPath

        /// Creates and returns a new Bézier path object with the contents of a Core Graphics path.
        ///
        /// - parameter cgPath: The Core Graphics path from which to obtain the initial path information. If this parameter is `nil`, the method raises an exception.
        /// - returns: A new path object with the specified path information.
        public convenience init(cgPath: CGPath) {
            self.init()
            self.cgPath = cgPath
        }

        /// The Core Graphics representation of the path.
        ///
        /// This property contains a snapshot of the path at any given point in time. Getting this property returns an immutable path object that you can pass to Core Graphics functions. The path object itself is owned by the `NSBezierPath` object and is valid only until you make further modifications to the path.
        ///
        /// You can set the value of this property to a path you built using the functions of the Core Graphics framework. When setting a new path, this method makes a copy of the path you provide.
        open var cgPath: CGPath {

            get {
                let path = CGMutablePath()
                let points = NSPointArray.allocate(capacity: 3)
                defer {
                    points.deallocate()
                }
                if elementCount > 0 {
                    var didClosePath = true
                    for index in 0 ..< elementCount {
                        let pathType = element(at: index, associatedPoints: points)
                        switch pathType {
                            case .moveTo:
                                path.move(to: points[0])
                            case .lineTo:
                                path.addLine(to: points[0])
                                didClosePath = false
                            case .curveTo:
                                path.addCurve(to: points[2], control1: points[0], control2: points[1])
                                didClosePath = false
                            case .closePath:
                                path.closeSubpath()
                                didClosePath = true
                            @unknown default:
                                break
                        }
                    }
                    if !didClosePath {
                        path.closeSubpath()
                    }
                }
                return path
            }

            set(cgPath) {
                removeAllPoints()
                cgPath.apply(
                    info: Unmanaged<NSBezierPath>.passUnretained(self).toOpaque(),
                    function: { context, pathElement in
                        guard let context = context else {
                            return
                        }
                        let bezierPath = Unmanaged<NativeBezierPath>
                            .fromOpaque(context)
                            .takeRetainedValue()
                        let points = pathElement.pointee.points
                        switch pathElement.pointee.type {
                            case .moveToPoint:
                                let point0 = points[0]
                                bezierPath.move(to: point0)
                            case .addLineToPoint:
                                let point0 = points[0]
                                bezierPath.line(to: point0)
                            case .addCurveToPoint:
                                let point0 = points[0]
                                let point1 = points[1]
                                let point2 = points[2]
                                bezierPath.curve(to: point2, controlPoint1: point0, controlPoint2: point1)
                            case .addQuadCurveToPoint:
                                points[2] = bezierPath.currentPoint
                                let point0 = CGPoint(
                                        x: points[2].x.addingProduct(points[0].x - points[2].x, 2/3),
                                        y: points[2].y.addingProduct(points[0].y - points[2].y, 2/3)
                                    )
                                let point1 = CGPoint(
                                        x: points[1].x.addingProduct(points[0].x - points[1].x, 2/3),
                                        y: points[1].y.addingProduct(points[0].y - points[1].y, 2/3)
                                    )
                                let point2 = points[2]
                                bezierPath.curve(to: point2, controlPoint1: point0, controlPoint2: point1)
                            case .closeSubpath:
                                bezierPath.close()
                            @unknown default:
                                break
                        }
                    }
                )
            }
        }
    }
#endif
