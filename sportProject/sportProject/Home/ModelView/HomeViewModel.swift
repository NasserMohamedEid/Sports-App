//
//  HomeViewModel.swift
//  sportProject
//
//  Created by Nasser Mohamed on 12/06/2022.
//

import Foundation
class HomeViewModel {
    
    var bindResultToHomeView : (() -> ()) = {}
    
    
    var result : [Sports]?{
        didSet{
            bindResultToHomeView()
        }
    }
    
    func getItems(){
        sportNetworkService.fetchResult {[weak self] (result) in
            
//
            
            self?.result = result?.sports
        }
    }
    
}
