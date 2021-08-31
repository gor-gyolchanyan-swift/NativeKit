//
// Introductory information is in the `README.md` file in the root directory of the repository this file is in.
// Licensing information is in the `LICENSE` file in the root directory of the repository this file is in.
//

import SwiftUI

// TODO: Find a way to constrain the `Body` without causing the "circular reference" error.
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public protocol NativeViewRepresentable: View {

    // MARK: - NativeViewRepresentable - NativeView

    associatedtype NativeViewType: NativeView

    func makeNativeView() -> NativeViewType

    func updateNativeView(_ nativeView: NativeViewType)

    // MARK: - NativeViewRepresentable - Coordinator

    associatedtype Coordinator = Void

    func makeCoordinator() -> Coordinator
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension NativeViewRepresentable
where Coordinator == Void {

    public func makeCoordinator() -> Coordinator {
        // This routine is intentionally left blank.
    }
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension NativeViewRepresentable {

    // MARK: - View

    public var body: some View {
        NativeViewRepresentableAdaptor(self)
    }
}
