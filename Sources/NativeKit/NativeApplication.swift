//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

#if os(macOS)
    import AppKit
    public typealias NativeApplication = AppKit.NSApplication
#elseif os(iOS) || os(tvOS)
    import UIKit
    public typealias NativeApplication = UIKit.UIApplication
#elseif os(watchOS)
    import WatchKit
    public typealias NativeApplication = WatchKit.WKExtension
#endif
