//
//  Onboarding.swift
//  LittleLemonRestaurantOrderApp
//
//  Created by Virgo Obraj on 1/3/25.
//

import SwiftUI
import CoreData

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct OnboardingView: View {
    
    @State var firstNameInput: String = ""
    @State var lastNameInput: String = ""
    @State var emailInput: String = ""
//    @State var isLoggedIn: Bool = false
    @State var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: kIsLoggedIn)
    
    var body: some View {
        NavigationView{
            VStack (spacing: 0){
                NavigationLink(destination: HomeScreenView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                Spacer(minLength: 20)
                ScrollView {
                    VStack {
                        TextField("First Name", text: $firstNameInput).font(.title2)
                            .bold()
                            .foregroundStyle(Color("CustomGreen"))
                            .multilineTextAlignment(.leading)
                        TextField("Last Name", text: $lastNameInput).font(.title2)
                            .bold()
                            .foregroundStyle(Color("CustomGreen"))
                            .multilineTextAlignment(.leading)
                        TextField("Email", text: $emailInput).font(.title2)
                            .bold()
                            .foregroundStyle(Color("CustomGreen"))
                            .multilineTextAlignment(.leading)
                        Button("Register") {
                            if !firstNameInput.isEmpty && !lastNameInput.isEmpty && !emailInput.isEmpty {
                                if isValidEmail(emailInput) {
                                    UserDefaults.standard.set($firstNameInput, forKey: kFirstName)
                                    UserDefaults.standard.set($lastNameInput, forKey: kLastName)
                                    UserDefaults.standard.set($emailInput, forKey: kEmail)
                                    UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                                    isLoggedIn = true
                                    print("User registered successfully!")
                                }
                            } else {
                                print("Please fill in all fields.")
                            }
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
            }
            .onAppear(){
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                    print("Global key is set to TRUE")
                }
        }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
