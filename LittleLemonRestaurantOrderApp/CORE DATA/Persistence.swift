//
//  Persistence.swift
//  LittleLemonRestaurantOrderApp
//
//  Created by Virgo Obraj on 1/3/25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    @MainActor
    static let preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "LittleLemonRestaurantOrderApp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: {_,_ in })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}

extension PersistenceController {
    func clear() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Dish.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try container.viewContext.execute(deleteRequest)
            try container.viewContext.save()
        } catch {
            print("Error clearing database: \(error)")
        }
    }
}

