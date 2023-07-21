import SwiftUI

struct TellUsAboutYourselfViewIncome: View {
    @Binding var profile: Profile
    let incomes = [
        "< 2,500 Lei",
        "2,501 - 5,000 Lei",
        "5,001 - 7,500 Lei",
        "7,501 - 11,250 Lei",
        "> 11,250 Lei"]
    
    @State private var selectedOccupation: String?
    let goToTellAboutYourselfDomain: () -> Void
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 10) {
                Text("What is your monthly net income?")
                    .font(.title3)
                    .padding(.horizontal, 15)
                    .padding(.top, 30)
                List(selection: $selectedOccupation) {
                    ForEach(incomes, id:\.self) { income in
                        HStack {
                            Text(income)
                                .padding(.horizontal, 15)
                            Spacer()
                            if selectedOccupation == income {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color(red: 0.4, green: 0.85, blue: 0.85))
                                    .padding(.horizontal, 15)
                            }
                            
                        }
                        
                    }
                    .frame(width: geometry.size.width, alignment: .leading)
                }
                .listStyle(GroupedListStyle())
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
                .ignoresSafeArea()
                Spacer()
                SettingsNotification()
                    .padding(.horizontal, 15)
                    .padding(.bottom, 15)
            }
        }
        .navigationTitle("Tell Us About Yourself")
        .onChange(of: selectedOccupation) { newValue in
            if newValue != nil {
                profile.income = selectedOccupation!
                goToTellAboutYourselfDomain()
            }
        }
    }
}

struct TellUsAboutYourselfViewIncome_Previews: PreviewProvider {
    @State static var profile = Profile.emptyProfile
    
    static var previews: some View {
        NavigationStack {
            TellUsAboutYourselfViewIncome(profile: $profile, goToTellAboutYourselfDomain: {})
        }
    }
}
