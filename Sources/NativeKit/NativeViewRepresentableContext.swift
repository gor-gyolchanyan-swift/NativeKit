//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

import SwiftUI

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public struct NativeViewRepresentableContext<ViewType>
where ViewType: NativeViewRepresentable {

    // MARK: - NativeViewRepresentableContext

    internal typealias AdaptorContext = NativeViewRepresentableAdaptor<ViewType>.Context

    internal init(_ adaptorContext: AdaptorContext) {
        self.adaptorContext = adaptorContext
    }

    internal let adaptorContext: AdaptorContext
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension NativeViewRepresentableContext {

    // MARK: - NativeViewRepresentableContext

    public var coordinator: ViewType.Coordinator {
        adaptorContext.coordinator
    }

    public var transaction: Transaction {
        adaptorContext.transaction
    }

    public var environment: EnvironmentValues {
        adaptorContext.environment
    }
}
