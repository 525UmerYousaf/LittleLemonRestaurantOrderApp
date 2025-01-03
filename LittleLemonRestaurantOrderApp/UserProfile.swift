//
//  UserProfile.swift
//  LittleLemonRestaurantOrderApp
//
//  Created by Virgo Obraj on 1/3/25.
//


import SwiftUI


struct UserProfileScreenView: View {
    
    var firstNameVal: String = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    var lastNameVal: String = UserDefaults.standard.string(forKey: kLastName) ?? ""
    var emailVal: String = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Text("Personal information").font(.title)
            Image("profile-image-placeholder")
            Text("First Name: \(firstNameVal)")
            Text("Last Name: \(lastNameVal)")
            Text("Email: \(emailVal)")
            Button("Log Out") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            Spacer()
        }.padding()
    }
}

struct UserProfileScreenView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileScreenView()
    }
}
