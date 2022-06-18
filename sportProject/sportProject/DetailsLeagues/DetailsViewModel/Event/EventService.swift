//
//  EventService.swift
//  sportProject
//
//  Created by Nasser Mohamed on 15/06/2022.
//

import Foundation
protocol EventService{
    static func fetchResult1(name:String,complitionHandler : @escaping (EventModel?) -> Void)
}

class EventNetworkService :EventService{
    

    static func fetchResult1(name:String,complitionHandler : @escaping (EventModel?) -> Void){
        let url_name="https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id="+name
    let url = URL(string: url_name)
    guard let newUrl = url else{
        return
    }
    let request = URLRequest(url: newUrl)
    let session = URLSession(configuration: URLSessionConfiguration.default)
    //URLSession.shared.dataTask(with: request) { (data, response, error) in
    //    //
    //}
    let task = session.dataTask(with: request) { (data, response, error) in
        guard let data = data else{
            return
        }
        do{
            let result = try JSONDecoder().decode(EventModel.self, from: data)
            //print(result.items[0].header ?? "")
            complitionHandler(result)
        }catch let error{
            print("HereEvent")
            print(error.localizedDescription)
            complitionHandler(nil)
        }
        
        
    }
    task.resume()
    
    }
}
