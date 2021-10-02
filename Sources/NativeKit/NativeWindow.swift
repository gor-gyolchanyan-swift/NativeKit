//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

#if os(macOS)
    import AppKit
    public typealias NativeWindow = AppKit.NSWindow
#elseif os(iOS) || os(tvOS)
    import UIKit
    public typealias NativeWindow = UIKit.UIWindow
#endif
