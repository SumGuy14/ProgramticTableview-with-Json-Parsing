//
//  Network Manager.swift
//  ProgrammaticTableview testPrep
//
//  Created by Sumedh Kulkarni on 6/23/26.
// URL : https://dummyjson.com/products/category/smartphones

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
                return}
            //print(data)
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(Phones.self, from: data)
                print(decodedData.products.count)
                completion(decodedData.products)
            }
            catch{
                //error
                print(error)
                completion([])
            }
            
        }
            .resume()
    }
}



/*
final class NetworkManager: NetworkProtocol, Sendable {
    static let shared: NetworkManager = NetworkManager()
    
    func fetchDataFrom(serverUrl: String, completion: @escaping ([Post]) -> ()) {
        
        guard let serverURL = URL(string: serverUrl) else {
            print("Server URL is invalid")
            // we need to return something
            completion([])
            return
        }
        
        let urlRequest = URLRequest(url: serverURL)
        let urlSession = URLSession.shared
        urlSession.dataTask(with: urlRequest) { data, response, error in
            // TODO: - code goes here
            
            if error != nil {
                print("Unable to fetch data from server, \(error!.localizedDescription)")
                completion([])
            }
            
            guard let receivedData = data else {
                print("Fetched data is nil")
                completion([])
                return
            }
            
            // parse the data into the model
            do {
                let receivedPostList = try JSONDecoder().decode([Post].self, from: receivedData)
                print(receivedPostList)
                completion(receivedPostList)
            } catch {
                print("Unable to parse the data into the model")
                completion([])
            }
        }
        .resume()
    }
}
*/
