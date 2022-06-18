//
//  teamsNetwork.swift
//  sportProject
//
//  Created by Nasser Mohamed on 16/06/2022.
//

import Foundation
protocol teamsService{
    static func fetchResult1(name:String,complitionHandler : @escaping (TeamsModel?) -> Void)
}

class TeamsNetworkService :teamsService{
    

    static func fetchResult1(name:String,complitionHandler : @escaping (TeamsModel?) -> Void){
        let newurl2 = name.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
    let url = URL(string:"https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l="+newurl2)
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
            let result = try JSONDecoder().decode(TeamsModel.self, from: data)
            //print(result.items[0].header ?? "")
            print(result.teams[0].strCountry)
            complitionHandler(result)
        }catch let error{
            print("HereXxx2222")
            print(error.localizedDescription)
            complitionHandler(nil)
        }
        
        
    }
    task.resume()
    
    }
}
