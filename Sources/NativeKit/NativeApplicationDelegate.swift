//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

#if os(macOS)
    import AppKit
    public typealias NativeApplicationDelegate = AppKit.NSApplicationDelegate
#elseif os(iOS) || os(tvOS)
    import UIKit
    public typealias NativeApplicationDelegate = UIKit.UIApplicationDelegate
#elseif os(watchOS)
    import WatchKit
    public typealias NativeApplicationDelegate = WatchKit.WKExtensionDelegate
#endif
