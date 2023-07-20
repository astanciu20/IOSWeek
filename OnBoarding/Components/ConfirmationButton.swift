import SwiftUI

struct ConfirmationButton: View {
    let text: String
    let isConfirmationEnabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .frame(maxWidth: .infinity)
                .bold()
                .font(.title2)
                .padding(10)
        }
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.cyan))
        .foregroundColor(.black)
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .opacity(isConfirmationEnabled ? 1.0 : 0.3)
        .disabled(!isConfirmationEnabled)
    }
}

struct ConfirmationButton_Previews: PreviewProvider {
    static var previews: some View {
        let text = "salut"
        let a = false
        ConfirmationButton(text: text, isConfirmationEnabled: a) {}
    }
}
