//
//  Network.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import Foundation

/// Lowest layer of network requests. Used only by the Network Manager
class Network{
    
    static let sharedInstance = Network()
    private init(){}
    

    func getData<T : Decodable>(urlExtension: String,
        completionHandler: @escaping(T?) -> ()){
        
        let jsonURL = (NetworkUtils.Mains.baseURL + "service/" + urlExtension)
        
        guard let url = URL(string: jsonURL) else { return }
        let request = URLRequest(url: url)
        
        requestData(rqst: request) { (data : T?) in
            completionHandler(data)
        }
    }

    func requestData<T: Decodable>( rqst: URLRequest, completionHandler: @escaping(T?) -> ()){
        
        var request = rqst
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let decoder = JSONDecoder()
                let data = try decoder.decode(T.self, from: dataResponse)
                completionHandler(data)
            } catch let parsingError {
                completionHandler(nil)
                print("Error",parsingError)
            }
        }
        task.resume()
    }
    

    func downloadImgFromURL(completionHandler: @escaping (UIImage) -> (),from url: URL?){
        
        guard let url = url else {
            completionHandler(UIImage(named: "live_stock_01") ?? UIImage())
            return
        }
        URLSession.shared.dataTask(with: url){
            (data, response, error) in
            guard let recData = data, error == nil else{
                print("Image download failed")
                return
            }
            
            completionHandler(UIImage(data: recData) ?? UIImage())
            }.resume()
    }
    
}
