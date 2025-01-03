//
//  Menu.swift
//  LittleLemonRestaurantOrderApp
//
//  Created by Virgo Obraj on 1/3/25.
//

import SwiftUI
import Foundation

struct MenuScreenView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var searchText: String = ""
    
    func getMenuData() {
        // Clear existing data
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let fullMenu = try? decoder.decode(MenuList.self, from: data) {
                    for menuItem in fullMenu.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = menuItem.title
                        dish.image = menuItem.image
                        dish.price = menuItem.price
                    }
                    try? viewContext.save()
                }
            }
        }
        task.resume()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))]
    }
        
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }


    
    var body: some View {
        VStack {
            Text("Little Lemon")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            Text("Chicago")
                .font(.title2)
                .foregroundColor(.gray)
            
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            TextField("Search menu", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            // Fetching dishes from Core Data
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach(dishes, id: \.self) { dish in
                        DishRow(dish: dish)
                    }
                }
            }
        }
        .onAppear {
            getMenuData()
        }
        .padding()
    }
}

// Helper view to simplify the ForEach block
struct DishRow: View {
    let dish: Dish
    
    var body: some View {
        NavigationLink(destination: DishDetailsScreen(dish: dish)) {
            HStack {
                Text("\(dish.title) - $\(dish.price)")
                Spacer()
                AsyncImage(url: URL(string: dish.image ?? "")) { image in
                    image.resizable()
                         .scaledToFit()
                         .frame(width: 50, height: 50)
                         .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            }
        }
    }
}

struct MenuScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreenView()
    }
}

