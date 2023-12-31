import SwiftUI

struct TellUsAboutYourselfViewOccupation: View {
    @Binding var profile: Profile
    let occupations = [
        "Employee",
        "Pensioner",
        "Student",
        "Household",
        "Investor",
        "Self-employed"]
    @State private var selectedOccupation: String?
    let goToTellAboutYourselfIncomes: () -> Void
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 10) {
                Text("What is your main occupation?")
                    .font(.title3)
                    .padding(.horizontal, 15)
                    .padding(.top, 30)
                List(selection: $selectedOccupation) {
                    ForEach(occupations, id: \.self) { occupation in
                        HStack {
                            Text(occupation)
                                .padding(.horizontal, 15)
                            Spacer()
                            if selectedOccupation == occupation {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color(red: 0.4, green: 0.85, blue: 0.85))
                                    .padding(.horizontal, 15)
                            }
                            
                        }
                        
                    }
                    .listSectionSeparator(.hidden)
                    .frame(width: geometry.size.width, alignment: .leading)
                }
                .listStyle(GroupedListStyle())
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
                
                Spacer()
                SettingsNotification()
                    .padding(.horizontal, 15)
                    .padding(.bottom, 15)
            }
        }
        .navigationTitle("Tell Us About Yourself")
        .onChange(of: selectedOccupation) { newValue in
            if newValue != nil {
                profile.occupation = selectedOccupation!
                goToTellAboutYourselfIncomes()
            }
        }
    }
}

struct TellUsAboutYourselfViewOccupation_Previews: PreviewProvider {
    @State static var profile = Profile.emptyProfile
    
    static var previews: some View {
        NavigationStack {
            TellUsAboutYourselfViewOccupation(profile: $profile, goToTellAboutYourselfIncomes: {})
        }
    }
}
