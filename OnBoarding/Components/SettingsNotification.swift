import SwiftUI

struct SettingsNotification: View {
    var body: some View {
        HStack {
            Image(systemName: "lightbulb")
            Text("You'll have the posibility to update this later, in the app settings")
        }
        .foregroundColor(.gray)
    }
}

struct SettingsNotification_Previews: PreviewProvider {
    static var previews: some View {
        SettingsNotification()
    }
}
