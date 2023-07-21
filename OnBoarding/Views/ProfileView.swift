//
//  SwiftUIView.swift
//  OnBoarding
//
//  Created by Andrei Stanciu on 21.07.2023.
//

import SwiftUI

struct ProfileView: View {
    @State var profile: Profile
    let goToCongrats: () -> Void
    @StateObject private var viewModel = AboutYouViewModel(profile: Profile.emptyProfile)

    private let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter
    }()
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Prenume:")
                Spacer()
                Text(viewModel.profile.firstName)
            }
            .padding(.vertical, 10)
            HStack {
                Text("Nume:")
                Spacer()
                Text(viewModel.profile.lastName)
            }
            .padding(.vertical, 10)
            HStack {
                Text("Date nasterii:")
                Spacer()
                Text(profile.dateOfBirth, formatter: dateFormat)
            }
            .padding(.vertical, 10)
            HStack {
                Text("Ocupatia:")
                Spacer()
                Text(profile.occupation)
            }
            .padding(.vertical, 10)
            HStack {
                Text("Venitul:")
                Spacer()
                Text(profile.income)
            }
            .padding(.vertical, 10)
            HStack {
                Text("Domeniu:")
                Spacer()
                Text(profile.domain)
            }
            .padding(.vertical, 10)
            Spacer()
            ConfirmationButton(text: "Next", isConfirmationEnabled: true, action: { goToCongrats() })
        }
        .font(.title2)
        .padding(20)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let profile = Profile.emptyProfile
        ProfileView(profile: profile, goToCongrats: {})
    }
}
