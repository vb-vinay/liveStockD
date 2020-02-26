//
//  NetworkManager.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 25/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import Foundation

class NetworkManager{
    
    static let shared = NetworkManager()
    private init(){}
    
    let network = Network.sharedInstance
    let urls = NetworkUtils.endPoints.self
    static let cache = NSCache<NSString,UIImage>()
    
    func getDashboard(completionHandler: @escaping(SliderList) -> ()){
        
        let slider = urls.slider
        
        network.getData(urlExtension: slider) { (slidersRecieved : SliderList?)  in
            
            if slidersRecieved != nil{
                completionHandler(slidersRecieved!)
            } else{
                print("Sliders not recieved")
            }
        }
    }
    func getSliders(completionHandler: @escaping(SliderList) -> ()){
        
        let slider = urls.slider
        
        network.getData(urlExtension: slider) { (slidersRecieved : SliderList?)  in
            
            if slidersRecieved != nil{
                completionHandler(slidersRecieved!)
            } else{
                print("Sliders not recieved")
            }
        }
    }
    func getProducts(completionHandler: @escaping(ProductList) -> ()){
        let product = urls.product
        
        network.getData(urlExtension: product) { (productsRecieved : ProductList?)  in
            
            if productsRecieved != nil{
                completionHandler(productsRecieved!)
            } else{
                print("Products not recieved")
            }
        }
    }
    func getMagazines(completionHandler: @escaping(MagazineList) -> ()){
        let magazine = urls.magazine
        
        network.getData(urlExtension: magazine) { (magazinesRecieved : MagazineList?)  in
            
            if magazinesRecieved != nil{
                completionHandler(magazinesRecieved!)
            } else{
                print("Magazines not recieved")
            }
        }
    }
    func getEvents(completionHandler: @escaping(EventList) -> ()){
        let event = urls.event
        
        network.getData(urlExtension: event) { (eventsRecieved : EventList?)  in
            
            if eventsRecieved != nil{
                completionHandler(eventsRecieved!)
            } else{
                print("Events not recieved")
            }
        }
    }
    func getNews(completionHandler: @escaping(NewsList) -> ()){
        let news = urls.news
        
        network.getData(urlExtension: news) { (newsRecieved : NewsList?)  in
            
            if newsRecieved != nil{
                completionHandler(newsRecieved!)
            } else{
                print("News not recieved")
            }
        }
    }
    
    func getImage(from urlExt: String, completion: @escaping (_ image: UIImage?) -> ()){
        
        let urlString = NetworkUtils.Mains.baseURL + "uploads/" + urlExt
        let url = URL(string: urlString)
//        guard let url = url else {
//            completion(UIImage(named: "live_stock_01") ?? UIImage())
//            return
//        }
        if let image = NetworkManager.cache.object(forKey: url!.absoluteString as NSString){
            completion(image)
        } else{
            downloadImageFromURL(from: url!, completionHandler: completion)
        }
    }
    
    /// Actual download happens here and image is stored in cache memory
    func downloadImageFromURL(from url: URL, completionHandler: @escaping (UIImage) -> ()){
        network.downloadImgFromURL(completionHandler: { (downloadedImage) in
            NetworkManager.cache.setObject(downloadedImage, forKey: url.absoluteString as NSString)
            completionHandler(downloadedImage)
        }, from: url)
    }

    
}
