//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

#if canImport(SwiftUI) && (arch(arm64) || arch(x86_64) || arch(powerpc64) || arch(powerpc64le))
    import SwiftUI

    #if os(macOS) || os(iOS) || os(tvOS)
        // TODO: Find a way to constrain the `Body` without causing the "circular reference" error.
        @available(macOS 10.15, iOS 13.0, tvOS 13.0, *)
        public protocol NativeViewControllerRepresentable: View {

            // MARK: - NativeViewControllerRepresentable - Context

            typealias Context = NativeViewControllerRepresentableContext<Self>

            // MARK: - NativeViewControllerRepresentable - NativeView

            associatedtype NativeViewControllerType: NativeViewController

            func makeNativeViewController(context: Context) -> NativeViewControllerType

            func updateNativeViewController(_ nativeViewController: NativeViewControllerType, context: Context)

            // MARK: - NativeViewControllerRepresentable - Coordinator

            associatedtype Coordinator = Void

            func makeCoordinator() -> Coordinator
        }

        @available(macOS 10.15, iOS 13.0, tvOS 13.0, *)
        extension NativeViewControllerRepresentable
        where Coordinator == Void {

            public func makeCoordinator() -> Coordinator {
                // This routine is intentionally left blank.
            }
        }

        @available(macOS 10.15, iOS 13.0, tvOS 13.0, *)
        extension NativeViewControllerRepresentable {

            // MARK: - View

            public var body: some View {
                NativeViewControllerRepresentableAdaptor(self)
            }
        }
    #endif
#endif
