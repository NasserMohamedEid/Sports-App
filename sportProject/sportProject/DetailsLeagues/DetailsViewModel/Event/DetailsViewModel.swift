//
//  DetailsViewModel.swift
//  sportProject
//
//  Created by Nasser Mohamed on 14/06/2022.
//

import Foundation
class EventViewModel {
    
    
    var bindResultToHomeView : (() -> ()) = {}
    
    
    var result : [Events]?{
        didSet{
            bindResultToHomeView()
        }
    }
    
    func getItems(leaguesName:String){
        EventNetworkService.fetchResult1(name: leaguesName, complitionHandler: {
            [weak self](result)in
            let expiryDate = result?.events?[0].dateEvent ?? ""// Jan 10 2020

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"

            if Date() > dateFormatter.date(from: expiryDate) ?? Date() {
                self?.result=result?.events}
        })
    
}
}
