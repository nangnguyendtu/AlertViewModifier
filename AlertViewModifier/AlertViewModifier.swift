import SwiftUI

struct AlertViewModifier: ViewModifier {
    @Binding var alert: AlertObject?
    
    func body(content: Content) -> some View {
        content
            .alert(
                alert?.title ?? "",
                isPresented: .constant(alert != nil),
                actions: {
                    Button(
                        alert?.titleSecondaryButton ?? "",
                        role: .cancel
                    ) {
                        alert = nil
                    }
                    if let titlePrimaryButton = alert?.titlePrimaryButton {
                        Button(
                            titlePrimaryButton,
                            role: alert?.alertType.primaryButtonRole
                        ) {
                            alert = nil
                        }
                    }
                }, message: {
                    Text(alert?.message ?? "")
                }
            )
    }
}

public extension View {
    func onViewAlert(with alert: Binding<AlertObject?>) -> some View {
        self.modifier(AlertViewModifier(alert: alert))
    }
}

public struct AlertObject {
    let title: String
    let message: String
    let titleSecondaryButton: String?
    let titlePrimaryButton: String?
    let alertType: AlertType
    
    public init(title: String, message: String, titleSecondaryButton: String? = nil, titlePrimaryButton: String? = nil, alertType: AlertType) {
        self.title = title
        self.message = message
        self.titleSecondaryButton = titleSecondaryButton
        self.titlePrimaryButton = titlePrimaryButton
        self.alertType = alertType
    }
}

public enum AlertType {
    case alert, confirm, destructive
    var primaryButtonRole: ButtonRole? {
        switch self {
        case .alert:
            return .cancel
        case .confirm:
            return nil
        case .destructive:
            return .destructive
        }
    }
}
