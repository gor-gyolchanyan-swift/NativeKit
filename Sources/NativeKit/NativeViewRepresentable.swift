//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

#if canImport(SwiftUI) && (arch(arm64) || arch(x86_64) || arch(powerpc64) || arch(powerpc64le))
    import SwiftUI

    // TODO: Find a way to constrain the `Body` without causing the "circular reference" error.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public protocol NativeViewRepresentable: View {

        // MARK: - NativeViewRepresentable - Context

        typealias Context = NativeViewRepresentableContext<Self>

        // MARK: - NativeViewRepresentable - NativeView

        associatedtype NativeViewType: NativeView

        func makeNativeView(context: Context) -> NativeViewType

        func updateNativeView(_ nativeView: NativeViewType, context: Context)

        // MARK: - NativeViewRepresentable - Coordinator

        associatedtype Coordinator = Void

        func makeCoordinator() -> Coordinator
    }

    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    extension NativeViewRepresentable
    where Coordinator == Void {

        public func makeCoordinator() -> Coordinator {
            return ()
        }
    }

    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    extension NativeViewRepresentable {

        // MARK: - View

        public var body: some View {
            NativeViewRepresentableAdaptor(self)
        }
    }
#endif
