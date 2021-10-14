import Foundation

class UserDefaultsService {
    
    //MARK: - Data saver
    func saveUsersData(data: [UserElement]) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(data) {
            UserDefaults.standard.set(encodedData, forKey: "savedData")
        }
    }
    
    //MARK: - Data loader
    func loadUsersData() -> [UserElement]? {
        if let savedData = UserDefaults.standard.object(forKey: "savedData") as? Data {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode([UserElement].self, from: savedData) {
                return loadedData
            }
        }
        return nil
    }
    
    //MARK: - ClearDataFromMemory
    func clearDataFromMemory() {
        UserDefaults.standard.removeObject(forKey: "savedData")
    }
}
