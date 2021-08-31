//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

import SwiftUI

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
internal struct NativeViewRepresentableAdaptor<ViewType>
where ViewType: NativeViewRepresentable {

    // MARK: - NativeViewRepresentableAdaptor

    internal init(_ view: ViewType) {
        self.view = view
    }

    internal let view: ViewType
}

#if os(macOS)
    @available(macOS 10.15, *)
    extension NativeViewRepresentableAdaptor: SwiftUI.NSViewRepresentable {

        // MARK: - SwiftUI.NSViewRepresentable - NSView

        internal typealias NSViewType = ViewType.NativeViewType

        internal func makeNSView(context: Context) -> NSViewType {
            view.makeNativeView()
        }

        internal func updateNSView(_ nsView: NSViewType, context: Context) {
            view.updateNativeView(nsView)
        }

        // MARK: - SwiftUI.NSViewRepresentable - Coordinator

        internal typealias Coordinator = ViewType.Coordinator

        internal func makeCoordinator() -> Coordinator {
            view.makeCoordinator()
        }
    }
#elseif os(iOS) || os(tvOS)
    @available(iOS 13.0, tvOS 13.0, *)
    extension NativeViewRepresentableAdaptor: SwiftUI.UIViewRepresentable {

        // MARK: - SwiftUI.UIViewRepresentable - UIView

        internal typealias UIViewType = ViewType.NativeViewType

        internal func makeUIView(context: Context) -> UIViewType {
            view.makeNativeView()
        }

        internal func updateUIView(_ uiView: UIViewType, context: Context) {
            view.updateNativeView(uiView)
        }

        // MARK: - SwiftUI.UIViewRepresentable - Coordinator

        internal typealias Coordinator = ViewType.Coordinator

        internal func makeCoordinator() -> Coordinator {
            view.makeCoordinator()
        }
    }
#elseif os(watchOS)
    @available(watchOS 6.0, *)
    extension NativeViewRepresentableAdaptor: SwiftUI.WKInterfaceObjectRepresentable {

        // MARK: - SwiftUI.WKInterfaceObjectRepresentable - WKInterfaceObject

        internal typealias WKInterfaceObjectType = ViewType.NativeViewType

        internal func makeWKInterfaceObject(context: Context) -> WKInterfaceObjectType {
            view.makeNativeView()
        }

        internal func updateWKInterfaceObject(_ wkInterfaceObject: WKInterfaceObjectType, context: Context) {
            view.updateNativeView(wkInterfaceObject)
        }

        // MARK: - SwiftUI.WKInterfaceObjectRepresentable - Coordinator

        internal typealias Coordinator = ViewType.Coordinator

        internal func makeCoordinator() -> Coordinator {
            view.makeCoordinator()
        }
    }
#endif
