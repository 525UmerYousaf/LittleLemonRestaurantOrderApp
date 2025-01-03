//
//  DishDetailsScreen.swift
//  LittleLemonRestaurantOrderApp
//
//  Created by Virgo Obraj on 1/3/25.
//

import SwiftUI

struct DishDetailsScreen: View {
    let dish: Dish
    
    var body: some View {
        VStack(spacing: 20) {
            Text(dish.title ?? "")
                .font(.largeTitle)
                .bold()
            
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image.resizable()
                     .scaledToFit()
                     .frame(height: 200)
            } placeholder: {
                ProgressView()
            }
            
            Text("Price: $\(dish.price)")
                .font(.title2)
            
            Spacer()
        }
        .padding()
    }
}
