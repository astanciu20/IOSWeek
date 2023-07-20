import SwiftUI

@main
struct OnBoardingApp: App {
    @State private var navigationScreen = [NavigationScreen]()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationScreen) {
                GetStartedView {
                    navigationScreen.append(.aboutYou)
                }
                    .navigationDestination(for: NavigationScreen.self) { screens in
                        switch screens {
                        case .aboutYou:
                            AboutYouView {
                                navigationScreen.append(.identificationConsent)
                            }
                        case .identificationConsent:
                            IdentificationConsentsView {
                                navigationScreen.append(.tellUsAboutYourselfOccupation)
                            }
                        case .tellUsAboutYourselfOccupation:
                            TellUsAboutYourselfViewOccupation()
                        case .tellUsAboutYourselfIncome:
                            TellUsAboutYourselfViewIncome()
                        case .tellUsAboutYourselfDomain:
                            TellUsAboutYourselfViewDomain()
                        }
                    }
            }
        }
    }
}
