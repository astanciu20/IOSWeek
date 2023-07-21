import SwiftUI

struct GetStartedView: View {
    @State private var selection = Language.english
    @State var profile: Profile
    let goToAboutYouView: () -> Void
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 30) {
                languageSelection
                Text("Welcome to IdeaBank! \nChoose an option below to get started.")
                    .font(.title3)
                Button {
                    goToAboutYouView()
                } label: {
                    HStack {
                        Image("openNewAccount")
                        Text("New customer")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }
                Spacer()
            }
            .padding(.init(top: 30, leading: 15, bottom: 15, trailing: 15))
            .navigationTitle("Get Started")
        }
    }
    
    @ViewBuilder private var languageSelection: some View {
        HStack {
            Spacer()
            Picker("", selection: $selection) {
                ForEach(Language.allCases, id: \.self) { language in
                    Text(language.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 150)
        }
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        let profile = Profile.emptyProfile
        NavigationStack {
            GetStartedView (profile: profile, goToAboutYouView: {})
        }
    }
}
