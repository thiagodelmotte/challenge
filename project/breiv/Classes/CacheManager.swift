
import Foundation
import CoreData

class CacheManager {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "breiv")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    func saveContext(_ objectContext: NSManagedObjectContext? = nil) -> Bool {
        let context = objectContext ?? self.persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
                return true
            } catch {
                return false
            }
        }
        
        return true
    }
    
    func get(_ entity: String, sort: [NSSortDescriptor]? = nil, predicate: NSPredicate? = nil) -> [NSManagedObject]? {
        let managedContext = self.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity)
        fetchRequest.sortDescriptors = sort
        fetchRequest.predicate = predicate
        
        return try? managedContext.fetch(fetchRequest)
    }
    
    func getDistinct(_ entity: String, sort: [NSSortDescriptor]? = nil, predicate: NSPredicate? = nil, propertyToFetch: String) -> [String]? {
        let managedContext = self.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.sortDescriptors = sort
        fetchRequest.predicate = predicate
        fetchRequest.returnsDistinctResults = true
        fetchRequest.propertiesToFetch = [propertyToFetch]
        fetchRequest.resultType = .dictionaryResultType
        
        let results = try? managedContext.fetch(fetchRequest)
        
        guard let resultsDict = results as? [[String: String]] else {
            return nil
        }
        
        return resultsDict.map {
            $0[propertyToFetch]
            } as? [String]
    }
    
    func deleteAllData(entity: String, predicate: NSPredicate? = nil) -> Bool {
        let managedContext = self.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.predicate = predicate
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            
            for managedObject in results {
                let managedObjectData: NSManagedObject = managedObject as! NSManagedObject
                managedContext.delete(managedObjectData)
            }
            
            return self.saveContext()
        } catch let error as NSError {
            print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
            return false
        }
    }
    
}
