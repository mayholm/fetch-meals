import SwiftUI

extension View {
    func redacted(_ redacted: Bool) -> some View {
        if redacted {
            return AnyView(self.redacted(reason: .placeholder))
        } else {
            return AnyView(self)
        }
    }
}

extension View {
    func loading(_ loading: Bool) -> some View {
        if loading {
            return AnyView(
                self
                    .redacted(reason: .placeholder)
                    .modifier(HorizontalGradientAnimating())
            )
        } else {
            return AnyView(self)
        }
    }
}

struct HorizontalGradientAnimating: ViewModifier {
    @State private var isAnimating: Bool = false

    func body(content: Content) -> some View {
        content
            .foregroundStyle(
                .linearGradient(
                    colors: isAnimating ? [.black, .white] : [.white, .black],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .animation(.linear(duration: 0.5).repeatForever(), value: isAnimating)
            .onAppear { isAnimating = true }
    }
}

