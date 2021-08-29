//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

import SwiftUI

#if os(macOS)
    @available(macOS 10.15, *)
    public typealias NativeHostingController = SwiftUI.NSHostingController
#elseif os(iOS) || os(tvOS)
    @available(macCatalyst 13.0, iOS 13.0, tvOS 13.0, *)
    public typealias NativeHostingController = SwiftUI.UIHostingController
#elseif os(watchOS)
    @available(watchOS 6.0, *)
    public typealias NativeHostingController = SwiftUI.WKHostingController
#endif
