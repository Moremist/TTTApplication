import Foundation

class API {
    static let shared = API()
    
    private let urlString = "https://jsonplaceholder.typicode.com/users"
    
    let errorUser = UserElement(id: 0, name: "Error", username: "Error", email: "Error", address: Address(street: "Error", suite: "Error", city: "Error", zipcode: "Error", geo: Geo(lat: "Error", lng: "Error")), phone: "Error", website: "Error", company: Company(name: "Error", catchPhrase: "Error", bs: "Error"))
    
    //MARK: - FetchData
    func fetchData(completion: @escaping ([UserElement]) -> () ){
        
        guard let url = URL(string: urlString) else {
            print("Fail to get URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let data = data, error == nil {
                do {
                    let convertedData = try JSONDecoder().decode([UserElement].self, from: data)
                    completion(convertedData)
                } catch let error {
                    print("Decoding error: \(error)")
                    completion([])
                }
            }
        }.resume()
    }
}
