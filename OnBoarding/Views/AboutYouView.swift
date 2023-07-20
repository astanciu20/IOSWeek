import SwiftUI

struct AboutYouView: View {
    @State private var isMrSelected = false
    @State private var isMsSelected = false
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var date = Date.now
    @State private var datePickerOn = false
    @State private var showGrayBackground = false
    
    let goToIdentificationConsent: () -> Void
    
    private var isNextEnabled: Bool {
        return (isMrSelected || isMsSelected) && !firstName.isEmpty && !lastName.isEmpty && isEighteenYearsOld(birthdate: date)
    }
    
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
                TextField("First name", text: $firstName)
                Divider()
            }
            VStack {
                TextField("Last name", text: $lastName)
                Divider()
            }
            datePicker
            Spacer()
            
            ConfirmationButton(text: "Next", isConfirmationEnabled: isNextEnabled) {
                goToIdentificationConsent()
            }
        }
        .padding(.init(top: 30, leading: 15, bottom: 15, trailing: 15))
        .navigationTitle("About You")
    }
    
    
    @ViewBuilder private var genderSelection: some View {
        HStack {
            Button {
                isMrSelected.toggle()
                if isMsSelected == true {
                    isMrSelected = false
                }
            } label: {
                Toggle("Mr", isOn: Binding(
                    get: { isMrSelected },
                    set: { newValue in
                        if newValue {
                            isMrSelected = true
                            isMsSelected = false
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
                isMsSelected.toggle()
                if isMrSelected == true {
                    isMsSelected = false
                }
            } label: {
                Toggle("Ms", isOn: Binding(
                    get: { isMsSelected },
                    set: { newValue in
                        if newValue {
                            isMsSelected = true
                            isMrSelected = false
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
                    datePickerOn.toggle()
                } label: {
                    Text(date, formatter: dateFormat)
                }
                .foregroundColor(.gray)
            }
            if datePickerOn {
                DatePicker("", selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.wheel)
                    .padding(.trailing)
                    .onAppear {
                        showGrayBackground = true
                    }
                    .onDisappear {
                        showGrayBackground = false                        }
            }
        }
        .background(Color.gray.opacity(showGrayBackground ? 0.1 : 0))
        .ignoresSafeArea()
    }
    
    private func isEighteenYearsOld(birthdate: Date) -> Bool {
        let calendar = Calendar.current
        if let eighteenYearsAgo = calendar.date(byAdding: .year, value: -18, to: Date()) {
            return calendar.compare(birthdate, to: eighteenYearsAgo, toGranularity: .day) == .orderedAscending
        }
        return false
    }
}

struct AboutYouView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AboutYouView {}
        }
    }
}
