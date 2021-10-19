import Foundation

class API {
    
    func getRequestData(urlString: String, complition: @escaping (Result<Data, Error>) -> () ){
        
        guard let url = URL(string: urlString) else {
            print("Fail to get URL")
            return
        }
        
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: url) { data, responce, error in
                if let error = error {
                    complition(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                complition(.success(data))
            }.resume()
        }
    }
}
