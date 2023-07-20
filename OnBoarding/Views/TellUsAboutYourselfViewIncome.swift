import SwiftUI

struct TellUsAboutYourselfViewIncome: View {
    let incomes = [
        "< 2,500 Lei",
        "2,501 - 5,000 Lei",
        "5,001 - 7,500 Lei",
        "7,501 - 11,250 Lei",
        "> 11,250 Lei"]
    
    @State private var navigationScreen = [NavigationScreen]()
    @State private var selectedOccupation: String?
    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $navigationScreen) {
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
        }
        .navigationTitle("Tell Us About Yourself")
        .navigationDestination(for: NavigationScreen.self) { _ in
            TellUsAboutYourselfViewIncome()
        }
    }
}

struct TellUsAboutYourselfViewIncome_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TellUsAboutYourselfViewIncome()
        }
    }
}
