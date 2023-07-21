import SwiftUI

struct AboutYouView: View {
    let goToIdentificationConsent: () -> Void
    @ObservedObject var viewModel: AboutYouViewModel
    
    private let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Please fill your basic information.")
                .font(.title3)
            genderSelection
            VStack {
                TextField("First name", text: $viewModel.profile.firstName)
                Divider()
            }
            VStack {
                TextField("Last name", text: $viewModel.profile.lastName)
                Divider()
            }
            datePicker
            Spacer()
            
            ConfirmationButton(text: "Next", isConfirmationEnabled: viewModel.isNextEnabled) {
                goToIdentificationConsent()
            }
        }
        .padding(.init(top: 30, leading: 15, bottom: 15, trailing: 15))
        .navigationTitle("About You")
    }
    
    
    @ViewBuilder private var genderSelection: some View {
        HStack {
            Button {
                viewModel.toggleMr()
            } label: {
                Toggle("Mr", isOn: Binding(
                    get: { viewModel.isMrSelected },
                    set: { newValue in
                        if newValue {
                            viewModel.isMrSelected = true
                            viewModel.isMsSelected = false
                        }
                    }
                ))
                .foregroundColor(.gray)
                .toggleStyle(.button)
                .background(RoundedRectangle(cornerRadius: 5)
                    .fill(.clear))
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 2))
            }
            
            Button {
                viewModel.toggleMs()
            } label: {
                Toggle("Ms", isOn: Binding(
                    get: { viewModel.isMsSelected },
                    set: { newValue in
                        if newValue {
                            viewModel.isMsSelected = true
                            viewModel.isMrSelected = false
                        }
                    }
                ))
                .foregroundColor(.gray)
                .toggleStyle(.button)
                .background(RoundedRectangle(cornerRadius: 5)
                    .fill(.clear))
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 2))
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder private var datePicker: some View {
        VStack {
            HStack {
                Text("Date of birth")
                Spacer()
                Button {
                    viewModel.datePickerOn.toggle()
                } label: {
                    Text(viewModel.profile.dateOfBirth, formatter: dateFormat)
                }
                .foregroundColor(.gray)
            }
            if viewModel.datePickerOn {
                DatePicker("", selection: $viewModel.profile.dateOfBirth, displayedComponents: [.date])
                    .datePickerStyle(.wheel)
                    .padding(.trailing)
                    .onAppear {
                        viewModel.showGrayBackground = true
                    }
                    .onDisappear {
                        viewModel.showGrayBackground = false                        }
            }
        }
        .background(Color.gray.opacity(viewModel.showGrayBackground ? 0.1 : 0))
        .ignoresSafeArea()
    }
}

struct AboutYouView_Previews: PreviewProvider {
    @State static var profile = Profile.emptyProfile
    
    static var previews: some View {
        NavigationStack {
            AboutYouView(goToIdentificationConsent: {}, viewModel: AboutYouViewModel(profile: profile))
        }
    }
}
