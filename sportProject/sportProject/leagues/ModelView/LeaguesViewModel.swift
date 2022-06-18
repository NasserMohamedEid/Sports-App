//
//  LeaguesViewModel.swift
//  sportProject
//
//  Created by Nasser Mohamed on 13/06/2022.
//

import Foundation
class LeaguesViewModel {
    
    var bindResultToHomeView : (() -> ()) = {}
    
    
    var result : [Countrie]?{
        didSet{
            bindResultToHomeView()
        }
    }
    
    func getItems(leaguesName:String){
        leaguesNetworkService.fetchResult1(name: leaguesName, complitionHandler: {
            [weak self](result)in
            self?.result=result?.countries
        })
    
}
}
