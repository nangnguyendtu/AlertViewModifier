import SwiftUI

struct AlertViewModifier: ViewModifier {
    @Binding var alert: Alert?
    
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

extension View {
    func onViewAlert(with alert: Binding<Alert?>) -> some View {
        self.modifier(AlertViewModifier(alert: alert))
    }
}

struct Alert {
    let title: String
    let message: String
    let titleSecondaryButton: String?
    let titlePrimaryButton: String?
    let alertType: AlertType
}

enum AlertType {
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
