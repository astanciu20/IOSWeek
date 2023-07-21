import SwiftUI

struct Profile {
    var firstName: String
    var lastName: String
    var dateOfBirth: Date
    var occupation: String
    var income: String
    var domain: String
    
    init(firstName: String, lastName: String, dateOfBirth: Date, occupation: String, income: String, domain: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.occupation = occupation
        self.income = income
        self.domain = domain
    }
    
    static var emptyProfile: Profile {
        Profile(firstName: "", lastName: "", dateOfBirth: Date(), occupation: "", income: "", domain: "")
    }
}
