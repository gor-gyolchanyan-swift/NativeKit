//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//
#if canImport(SwiftUI) && (arch(arm64) || arch(x86_64) || arch(powerpc64) || arch(powerpc64le))
    import SwiftUI

    #if os(macOS) || os(iOS) || os(tvOS)
        @available(macOS 10.15, iOS 13.0, tvOS 13.0, *)
        internal struct NativeViewControllerRepresentableAdaptor<ViewType>
        where ViewType: NativeViewControllerRepresentable {

            // MARK: - NativeViewRepresentableAdaptor

            internal init(_ view: ViewType) {
                self.view = view
            }

            internal let view: ViewType
        }
    #endif

    #if os(macOS)
        @available(macOS 10.15, *)
        extension NativeViewControllerRepresentableAdaptor: SwiftUI.NSViewControllerRepresentable {

            // MARK: - SwiftUI.NSViewControllerRepresentable - NSView

            internal typealias NSViewControllerType = ViewType.NativeViewControllerType

            internal func makeNSViewController(context: Context) -> NSViewControllerType {
                view.makeNativeViewController(context: .init(context))
            }

            internal func updateNSViewController(_ nsViewController: NSViewControllerType, context: Context) {
                view.updateNativeViewController(nsViewController, context: .init(context))
            }

            // MARK: - SwiftUI.NSViewControllerRepresentable - Coordinator

            internal typealias Coordinator = ViewType.Coordinator

            internal func makeCoordinator() -> Coordinator {
                view.makeCoordinator()
            }
        }
    #elseif os(iOS) && (arch(arm64) || arch(x86_64) || arch(powerpc64) || arch(powerpc64le)) || os(tvOS)
        @available(iOS 13.0, tvOS 13.0, *)
        extension NativeViewControllerRepresentableAdaptor: SwiftUI.UIViewControllerRepresentable {

            // MARK: - SwiftUI.UIViewControllerRepresentable - UIView

            internal typealias UIViewControllerType = ViewType.NativeViewControllerType

            internal func makeUIViewController(context: Context) -> UIViewControllerType {
                view.makeNativeViewController(context: .init(context))
            }

            internal func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
                view.updateNativeViewController(uiViewController, context: .init(context))
            }

            // MARK: - SwiftUI.UIViewControllerRepresentable - Coordinator

            internal typealias Coordinator = ViewType.Coordinator

            internal func makeCoordinator() -> Coordinator {
                view.makeCoordinator()
            }
        }
    #endif
#endif
