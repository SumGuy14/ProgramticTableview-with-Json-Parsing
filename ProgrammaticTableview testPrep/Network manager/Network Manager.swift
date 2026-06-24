import Foundation
protocol NetworkProtocol{
    func fetchDataFromUrl(url: String, completion: @escaping ([Phone]) -> Void)
}

final class NetworkManager : NetworkProtocol, Sendable{
    
    static let shared: NetworkManager = NetworkManager()
    
    func fetchDataFromUrl(url: String, completion: @escaping ([Phone]) -> Void) {
        
        guard let serverURL = URL(string: url) else {
            
            print("URL Invalid")
            completion([])
            return
        }
        
        let urlRequest = URLRequest(url: serverURL)
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                
                print("fetched data is nil")
                completion([])
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(Products.self, from: data)
                completion(decodedData.products)
            }
            catch{
                print(error)
                completion([])
            }
        }
        .resume()
    }
}
