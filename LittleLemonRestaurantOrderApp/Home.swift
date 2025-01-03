//
//  Home.swift
//  LittleLemonRestaurantOrderApp
//
//  Created by Virgo Obraj on 1/3/25.
//
import SwiftUI


struct HomeScreenView: View {
    
    let persistence = PersistenceController.shared
    
    var body: some View {
        TabView{
            MenuScreenView().tabItem({
                Label("Menu", systemImage: "square.and.arrow.up")
            }).environment(\.managedObjectContext, persistence.container.viewContext)
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
