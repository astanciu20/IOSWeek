import SwiftUI

@main
struct OnBoardingApp: App {
    @State private var navigationScreen = [NavigationScreen]()
    @State private var isLaunchScreenEnabled = true
    @State var profile: Profile = Profile.emptyProfile
    @StateObject private var viewModel = AboutYouViewModel(profile: Profile.emptyProfile)
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationScreen) {
                if isLaunchScreenEnabled {
                    LaunchScreen(imageName: "launch_screen")
                        .onAppear {
                            startTimer()
                        }
                } else {
                    GetStartedView (profile: profile, goToAboutYouView:
                    {
                        navigationScreen.append(.aboutYou)
                    })
                    .navigationDestination(for: NavigationScreen.self) { screens in
                        switch screens {
                        case .aboutYou:
                            AboutYouView(goToIdentificationConsent: {
                                navigationScreen.append(.identificationConsent)
                            }, viewModel: viewModel)
                        case .identificationConsent:
                            IdentificationConsentsView {
                                navigationScreen.append(.tellUsAboutYourselfOccupation)
                            }
                        case .tellUsAboutYourselfOccupation:
                            TellUsAboutYourselfViewOccupation(profile: $profile, goToTellAboutYourselfIncomes: {
                                navigationScreen.append(.tellUsAboutYourselfIncome)
                            })
                        case .tellUsAboutYourselfIncome:
                            TellUsAboutYourselfViewIncome(profile: $profile, goToTellAboutYourselfDomain: {
                                navigationScreen.append(.tellUsAboutYourselfDomain)
                            })
                        case .tellUsAboutYourselfDomain:
                            TellUsAboutYourselfViewDomain(profile: $profile, goToProfile: {
                                navigationScreen.append(.profileview)
                            })
                        case .profileview:
                            ProfileView(profile: profile, goToCongrats: {
                                navigationScreen.append(.congrats)
                            })
                        case .congrats:
                            Congrats()
                        }
                    }
                }
            }
        }
    }
    
    private func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLaunchScreenEnabled = false
        }
    }
}
