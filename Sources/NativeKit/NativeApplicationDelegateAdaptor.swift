//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

#if canImport(SwiftUI) && (arch(arm64) || arch(x86_64) || arch(powerpc64) || arch(powerpc64le))
    import SwiftUI

    #if os(macOS)
        @available(macOS 11.0, *)
        public typealias NativeApplicationDelegateAdaptor = SwiftUI.NSApplicationDelegateAdaptor
    #elseif os(iOS) || os(tvOS)
        @available(iOS 14.0, tvOS 14.0, *)
        public typealias NativeApplicationDelegateAdaptor = SwiftUI.UIApplicationDelegateAdaptor
    #elseif os(watchOS)
        @available(watchOS 7.0, *)
        public typealias NativeApplicationDelegateAdaptor = SwiftUI.WKExtensionDelegateAdaptor
    #endif
#endif
