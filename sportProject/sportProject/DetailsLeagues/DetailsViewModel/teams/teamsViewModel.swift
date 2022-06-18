//
//  teamsViewModel.swift
//  sportProject
//
//  Created by Nasser Mohamed on 16/06/2022.
//

import Foundation
class TeamsViewModel {
    
    
    var bindResultToHomeView : (() -> ()) = {}
    
    
    var result : [Teams]?{
        didSet{
            bindResultToHomeView()
        }
    }
    
    func getItems(leaguesName:String){
        TeamsNetworkService.fetchResult1(name: leaguesName, complitionHandler: {
            [weak self](result)in
            self?.result=result?.teams
        })
    
}
}
