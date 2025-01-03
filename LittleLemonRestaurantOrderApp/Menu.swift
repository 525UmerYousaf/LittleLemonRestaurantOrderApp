//
//  Menu.swift
//  LittleLemonRestaurantOrderApp
//
//  Created by Virgo Obraj on 1/3/25.
//

import SwiftUI


struct MenuScreenView: View {
    var body: some View {
        VStack{
            Text("Little Lemon").font(.title)
            Text("Chicago").font(.title2)
            Text("We are a family owned Mediterranean restaurant, focues on traditional recipes served with a modern twist.")
            List {
                Text("Sample Menu Item 1")
                Text("Sample Menu Item 2")
                Text("Sample Menu Item 3")
            }
        }.padding()
    }
}

struct MenuScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreenView()
    }
}
