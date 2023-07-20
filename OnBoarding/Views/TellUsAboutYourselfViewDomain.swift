import SwiftUI

struct TellUsAboutYourselfViewDomain: View {
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
    
    @State private var navigationScreen = [NavigationScreen]()
    @State private var selectedOccupation: String?
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $navigationScreen) {
                VStack(alignment: .leading, spacing: 30) {
                    Text("What is your main occupation?")
                        .font(.title3)
                    
                    ForEach(domains, id: \.self) { rowDomains in
                        HStack {
                            ForEach(rowDomains, id: \.self) { domain in
                                Button(action: {
                                }) {
                                    Toggle(domain, isOn: .constant(false))
                                        .foregroundColor(.gray)
                                        .toggleStyle(.button)
                                        .background(RoundedRectangle(cornerRadius: 5)
                                                        .fill(.clear))
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
        }
        .padding(.init(top: 30, leading: 15, bottom: 15, trailing: 15))
        .navigationTitle("Tell Us About Yourself")
        .navigationDestination(for: NavigationScreen.self) { _ in
            TellUsAboutYourselfViewIncome()
        }
    }
}

struct TellUsAboutYourselfViewDomain_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TellUsAboutYourselfViewDomain()
        }
    }
}
