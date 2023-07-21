import SwiftUI

struct TellUsAboutYourselfViewDomain: View {
    @Binding var profile: Profile
    let domains = [
        ["Arts, culture, sports", "Commerce"],
        ["Construction, real estate", "Education"],
        ["Farming", "Financial services, consultancy"],
        ["Healthcare", "HoReCa", "IT"],
        ["Manufacturing, metallurgy"],
        ["Mining, oil, gas, energy", "Public system"],
        ["Research, communication, media"],
        ["Transport, logistics", "Other"],
    ]
    
    @State private var selectedOccupation: String?
    let goToProfile: () -> Void
   
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 30) {
                Text("What is your main occupation?")
                    .font(.title3)
                
                ForEach(domains, id: \.self) { rowDomains in
                    HStack {
                        ForEach(rowDomains, id: \.self) { domain in
                            Button(action: {
                                selectedOccupation = domain
                                profile.domain = domain
                                goToProfile()
                            }) {
                                Text(domain)
                                    .foregroundColor(.gray)
                                    .padding(8)
                                    .background(RoundedRectangle(cornerRadius: 5)
                                        .fill(selectedOccupation == domain ? Color(red: 0.4, green: 0.85, blue: 0.85).opacity(0.2) : Color.clear))
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(.gray, lineWidth: 2))
                            }
                            .frame(height: 20)
                        }
                    }
                }
                
                Spacer()
                SettingsNotification()
            }
        }
        .navigationTitle("Tell Us About Yourself")
        .padding(.init(top: 30, leading: 15, bottom: 15, trailing: 15))
    }
}

struct TellUsAboutYourselfViewDomain_Previews: PreviewProvider {
    @State static var profile = Profile.emptyProfile
    
    static var previews: some View {
        NavigationStack {
            TellUsAboutYourselfViewDomain(profile: $profile, goToProfile: {})
        }
    }
}
