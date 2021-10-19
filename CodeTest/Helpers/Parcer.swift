import Foundation

class Parcer {
    
    let api = API()
    
    //MARK: - FetchData
    func fetchData(urlString: String, completion: @escaping ([UserElement]?) -> ()) {
        api.getRequestData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let userData = try JSONDecoder().decode([UserElement].self, from: data)
                    completion(userData)
                } catch let jsonError{
                    print("Failed to decode data ", jsonError)
                }
            case .failure(let error):
                print("Get data with error ", error)
                completion(nil)
            }
        }
    }
}
