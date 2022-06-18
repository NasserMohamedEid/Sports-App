//
//  LeaguesNetwork.swift
//  sportProject
//
//  Created by Nasser Mohamed on 13/06/2022.
//

import Foundation
protocol leaguesService{
    static func fetchResult1(name:String,complitionHandler : @escaping (Leagues?) -> Void)
}

class leaguesNetworkService :leaguesService {
    

    static func fetchResult1(name:String,complitionHandler : @escaping (Leagues?) -> Void){
        let url_name="https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s="+name
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
            let result = try JSONDecoder().decode(Leagues.self, from: data)
            //print(result.items[0].header ?? "")
            complitionHandler(result)
        }catch let error{
            print("HereX")
            print(error.localizedDescription)
            complitionHandler(nil)
        }
        
        
    }
    task.resume()
    
    }
}
