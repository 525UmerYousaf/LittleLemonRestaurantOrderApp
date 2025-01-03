//
//  Home.swift
//  LittleLemonRestaurantOrderApp
//
//  Created by Virgo Obraj on 1/3/25.
//
import SwiftUI


struct HomeScreenView: View {
    var body: some View {
        TabView{
            MenuScreenView().tabItem({
                Label("Menu", systemImage: "square.and.arrow.up")
            })
            UserProfileScreenView().tabItem({
                Label("Profile", systemImage: "person.circle")
            })
        }.navigationBarBackButtonHidden(true)
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
