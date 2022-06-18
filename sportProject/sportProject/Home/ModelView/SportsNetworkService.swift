//
//  SportsNetworkService.swift
//  sportProject
//
//  Created by Nasser Mohamed on 12/06/2022.
//

import Foundation
protocol sportService{
    static func fetchResult(complitionHandler : @escaping (Result?) -> Void)
}

class sportNetworkService :sportService {
    

static func fetchResult(complitionHandler : @escaping (Result?) -> Void){
    let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/all_sports.php")
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
            let result = try JSONDecoder().decode(Result.self, from: data)
            //print(result.items[0].header ?? "")
            complitionHandler(result)
        }catch let error{
            print("Here HOME")
            print(error.localizedDescription)
            complitionHandler(nil)
        }
        
        
    }
    task.resume()
    
    }
}
