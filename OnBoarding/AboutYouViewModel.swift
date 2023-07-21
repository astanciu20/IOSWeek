import Foundation

class AboutYouViewModel: ObservableObject {
    @Published var isMrSelected = false
    @Published var isMsSelected = false
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var date = Date.now
    @Published var datePickerOn = false
    @Published var showGrayBackground = false
    var profile: Profile
        
        init(profile: Profile) {
            self.profile = profile
        }
    
    var isNextEnabled: Bool {
        return (isMrSelected || isMsSelected) && !profile.firstName.isEmpty && !profile.lastName.isEmpty && isEighteenYearsOld(birthdate: profile.dateOfBirth)
    }
    
    private func isEighteenYearsOld(birthdate: Date) -> Bool {
        let calendar = Calendar.current
        if let eighteenYearsAgo = calendar.date(byAdding: .year, value: -18, to: Date()) {
            return calendar.compare(birthdate, to: eighteenYearsAgo, toGranularity: .day) == .orderedAscending
        }
        return false
    }
    
    func toggleMr() {
        isMrSelected.toggle()
        if isMsSelected == true {
            isMrSelected = false
        }
    }
    
    func toggleMs() {
        isMsSelected.toggle()
        if isMrSelected == true {
            isMsSelected = false
        }
    }
}
