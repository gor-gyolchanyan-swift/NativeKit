//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

#if os(macOS)
    import AppKit
    @available(macOS 10.11, *)
    public typealias NativeLayoutGuide = AppKit.NSLayoutGuide
#elseif os(iOS) || os(tvOS)
    import UIKit
    public typealias NativeLayoutGuide = UIKit.UILayoutGuide
#endif
