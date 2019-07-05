
import Foundation
import CoreData

class AuthModel: Codable {
    
    let authEntity = "Auth"
    
    var accessToken: String?
    
    func get() -> AuthModel? {
        guard let managedObjects = CacheManager().get(self.authEntity) else {
            return nil
        }
        
        return self.convert(managedObjects)
    }
    
    func save() -> Bool {
        guard self.delete() else {
            return false
        }
        
        let cacheManager = CacheManager()
        let managedContext = cacheManager.persistentContainer.viewContext
        
        let auth = NSEntityDescription.insertNewObject(forEntityName: self.authEntity, into: managedContext) as! Auth
        auth.accessToken = self.accessToken ?? nil
        
        return cacheManager.saveContext()
    }
    
    func delete() -> Bool {
        return CacheManager().deleteAllData(entity: self.authEntity)
    }
    
    func convert(_ objects: [NSManagedObject]) -> AuthModel? {
        guard let object = objects.first else {
            return nil
        }
        
        let auth = object as! Auth
        
        let authModel = AuthModel()
        authModel.accessToken = auth.accessToken
        
        return authModel
    }
    
}
