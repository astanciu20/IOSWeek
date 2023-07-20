import SwiftUI

struct IdentificationConsentsView: View {
    @State private var isNextOn = false
    let goTellUsAboutYourselfOccupation: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Before you continue the remote identification process, we need your consents.")
                .font(.title2)
                .bold()
            HStack(alignment: .top) {
                Text("I, hereby, **explicitly consent** to the processing of my biometric data and the capturing of photographs and/or images of myself and my identity document for the purpose of uniquely identifying me as a natural person during this online identification process.")
                    .layoutPriority(1)
                    .font(.title3)
                Toggle(isOn: $isNextOn) {
                    EmptyView()
                }
                    .tint(Color(red: 0.4, green: 0.85, blue: 0.85))
            }
            HStack {
                Spacer()
                Text("Read more")
                    .foregroundColor(Color(red: 0.4, green: 0.85, blue: 0.85))
            }
            Spacer()
            ConfirmationButton(text: "I consent", isConfirmationEnabled: isNextOn) {
                goTellUsAboutYourselfOccupation()
            }
        }
        .padding(.init(top: 30, leading: 15, bottom: 15, trailing: 15))
        .navigationTitle("Identification Consents")
    }
}

struct IdentificationConsentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            IdentificationConsentsView {}
        }
    }
}


